{ config, lib, pkgs, ... }: {
  config = {
      home.packages = with pkgs;[
        clojure        
        clojure-lsp
      ];
   };
}
