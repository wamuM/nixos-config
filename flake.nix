{
  description = "Configuration for all my (wamu_M) systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
    	url = "github:nix-community/home-manager/release-25.11";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = { 
	joseph = nixpkgs.lib.nixosSystem {
      		specialArgs = {inherit inputs;};
	   	system = "x86_64-Linux";	
      		modules = [
        	./nixos/joseph/configuration.nix
			home-manager.nixosModules.home-manager{
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.extraSpecialArgs = {inherit inputs;};
				home-manager.users.wamu-m = ./home-manager/users/monolithic/home.nix;
			}
      		];
	};
    };
  };
}
