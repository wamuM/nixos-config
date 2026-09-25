{ config, lib, pkgs, ... }:
{
  options.programming.latex.enable =
    lib.mkEnableOption "LaTeX";
  config = lib.mkIf config.programming.latex.enable {
      environment.systemPackages = with pkgs;[
        (texlive.combined.scheme-medium.withPackages (ps: with ps; [

        ]))
      ];
   };
}
