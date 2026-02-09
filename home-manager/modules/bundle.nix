{ lib, ... }:
{
imports = [
	./user-config.nix
	./input-method.nix
	./git.nix	
	./bash.nix
    ./dotfiles.nix
    ./firefox.nix
    ./rofi.nix
];
}


