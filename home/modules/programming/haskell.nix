{ config, lib, pkgs, ... }:
{
  config = {
      home.packages = with pkgs;[
        stack
        haskell-language-server
        ghc
      ];
   };
}
