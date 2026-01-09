{ inputs, config, pkgs, ... }:
{
  users.users.wamu-m = {
    isNormalUser = true;
    description = "wamu_M";
    extraGroups = [ "networkmanager" "wheel" ];
  }; 
}
