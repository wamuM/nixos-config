{ lib, ... }:
{
imports = [
	./user-config.nix
	./input-method.nix
	./git.nix	
	./bash.nix
];
input-method.enable = lib.mkDefault true;
}


