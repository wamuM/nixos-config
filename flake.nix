{
  description = "Configuration for all my (wamu_M) systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
    	url = "github:nix-community/home-manager/release-25.11";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = { 
	joseph = nixpkgs.lib.nixosSystem {
      		specialArgs = {inherit inputs;};
	   	system = "x86_64-Linux";	
      		modules = [
        		./nixos/joseph/configuration.nix
      		];
	};
    };
  };
}
