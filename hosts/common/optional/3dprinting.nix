{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    printrun   # Program that controls the printer (includes Pronterface)
    orca-slicer 
  ];
}
