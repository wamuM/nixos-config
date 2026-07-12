{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    amfora
  ];
}
