{ config, lib, pkgs, ... }:
{
  options.programming.clojure.enable =
    lib.mkEnableOption "Clojure (Lisp dialect) programming language";
  config = lib.mkIf config.programming.haskell.enable {
      environment.systemPackages = with pkgs;[
        clojure
      ];
   };
}
