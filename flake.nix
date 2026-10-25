{
description = "wamu_M's Nix Config";
inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    sops-nix = {
        url = "github:Mic92/sops-nix";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
        url = "github:nix-community/home-manager/release-26.05";
        inputs.nixpkgs.follows = "nixpkgs";
    };
};
outputs = { self, nixpkgs, home-manager, sops-nix, ... }@inputs:
let
    lib = nixpkgs.lib;

    hostEntries = builtins.readDir ./hosts;
    hosts = lib.filter 
        (name: 
            hostEntries.${name} == "directory"
         && builtins.pathExists ( ./hosts + "/${name}/configuration.nix"))
        (builtins.attrNames hostEntries);

    usersForHost = host: 
    let
        usersDir = ./hosts + "/${host}/users/";
    in 
        if builtins.pathExists usersDir then
            let 
                dirContents = builtins.readDir usersDir;
                nixFiles = lib.filterAttrs (name: type: type == "regular" && lib.hasSuffix ".nix" name) dirContents;
            in map (name: lib.removeSuffix ".nix" name) (builtins.attrNames nixFiles)
        else [];

    systemForHost = host: {
        # joseph = "x86_64-linux";
        # leonard = "x86_64-linux";
    }.${host} or "x86_64-linux";
    
    mkHost = host: lib.nixosSystem {
        system = systemForHost host;
        specialArgs = { inherit inputs; };

        modules = [
            ./hosts/common
            ./hosts/${host}/configuration.nix

            { users.users.root.hashedPassword = "!"; }

            home-manager.nixosModules.home-manager 

            {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = { inherit inputs; };
            }
        ] ++ (map (user: ./hosts + "/${host}/users/${user}.nix") (usersForHost host));
    };
in
{
    nixosConfigurations = lib.genAttrs hosts mkHost;
};
}
