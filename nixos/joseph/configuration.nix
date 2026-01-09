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
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";
}
