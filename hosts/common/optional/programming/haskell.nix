{ config, lib, pkgs, ... }:
{
  options.programming.haskell.enable =
    lib.mkEnableOption "Haskell programming language";
  config = lib.mkIf config.programming.haskell.enable {
      environment.systemPackages = with pkgs;[
        haskell-language-server
      ];
   };
}
