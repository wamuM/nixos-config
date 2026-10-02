{ config, lib, pkgs, ... }:
{
  options = {};
  config =  {
      home.packages = with pkgs;[
        (texlive.combined.scheme-full.withPackages (ps: with ps; [
            enumitem
        ]))
      ];
   };
}
