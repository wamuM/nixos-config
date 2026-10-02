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

    usersForHost = host: {
        joseph = [ "wamu-m" ];
        leonard = [ "wamu-m" ];
    }.${host} or [];

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

            {
                users.users = builtins.listToAttrs (map (user: {
                    name = user;
                    value = {
                        isNormalUser = true;
                        home = "/home/${user}";
                    };
                }) (usersForHost host));
            }

            home-manager.nixosModules.home-manager 

            {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = { inherit inputs; };

                home-manager.users = builtins.listToAttrs ( map (user: {
                    name = user;
                    value = import ./home/${user}.nix;
                }) (usersForHost host) );
            }
        ];
    };
in
{
    nixosConfigurations = lib.genAttrs hosts mkHost;
};
}
