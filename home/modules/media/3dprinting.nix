{ inputs, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    printrun   # Program that controls the printer (includes Pronterface)
    orca-slicer 
  ];
}
