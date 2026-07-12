{ config, lib, ... }:
{
 imports = [
        ./core.nix

        ./c-cpp.nix
        ./haskell.nix
        ./java.nix
        ./js.nix
        ./json.nix
        ./latex.nix
        ./lean.nix
        ./lua.nix
        ./prolog.nix
        ./python.nix
        ./rust.nix
        ./yaml.nix
 ];
}
