{ inputs, config, pkgs, ... }:
{
  home.packages = with pkgs; [
   cinny-desktop 
  ];
}
