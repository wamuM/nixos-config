{ inputs, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    thunderbird
  ];
}
