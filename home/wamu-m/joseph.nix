{config, pkgs, lib, ...}:
{
  imports = [ 
    ./common/optional/firefox.nix
  ];
  options = {};
  config = {
    bundle.st-desktop.enable = true;
  };
}
