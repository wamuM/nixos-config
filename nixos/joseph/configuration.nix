{ inputs, config, pkgs, ... }:
{
  imports =
    [ 
      ./boot.nix
      ./gnupg.nix
      ./graphical.nix
      ./hardware-configuration.nix
      ./locale.nix
      ./other.nix
      ./packages.nix
      ./users.nix
      ./fonts.nix
      ./programming.nix
      ./networking.nix
      ./docker.nix
      ./terminal.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";
}
