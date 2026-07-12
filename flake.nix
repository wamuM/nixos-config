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
  hosts =
    lib.filter (name: 
       hostEntries.${name} == "directory"
       && builtins.pathExists (./hosts + "/${name}/configuration.nix")
    )
    (builtins.attrNames hostEntries);

  systemForHost = host: let systems = {
     ## Define here systems for specific hosts
  };
  in if systems ? "${host}" then systems.${host} else "x86_64-linux";

  # Get's users with matching HM configuration
  getHMUsers = host : let 
    users = builtins.attrNames (builtins.readDir ./home);
    hasHostFile = user: builtins.pathExists (./home + "/${user}/${host}.nix");
  in builtins.filter hasHostFile users;
    
  mkHost = host: lib.nixosSystem {
        system = systemForHost host;

        specialArgs = { inherit inputs; };
        
        modules = lib.flatten [
            [
            ./hosts/common/core
            ./hosts/${host}/configuration.nix
            ]
            (map (user: ./hosts/common/users + "/${user}.nix") (getHMUsers host))
            [
            home-manager.nixosModules.home-manager
            {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = {inherit inputs;};
                home-manager.users =
                builtins.listToAttrs (
                    map (user: {
                        name = user;
                        value = { 
                            imports = [ 
                                ./home/${user}/common/core
                                ./home/${user}/${host}.nix
                            ];
                        };
                    })
                    (getHMUsers host)
                );
            }
            ]
        ];
  };
in
{
  nixosConfigurations = lib.genAttrs hosts mkHost;
};
}
