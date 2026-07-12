{ inputs, config, pkgs, lib, ... }:
{
  networking.networkmanager.enable = true;

  services.printing.enable = true;
  hardware.bluetooth.enable = true;

  environment.systemPackages = with pkgs; [
    openfortivpn
  ];
}  
