{ config, lib, pkgs, ...}:
{
    options.programming.C.enable = lib.mkEnableOption "C programming language";
    options.programming.Cpp.enable = lib.mkEnableOption "C++ programming language";

    config = lib.mkMerge [
    (lib.mkIf (
            config.programming.C.enable 
        ||  config.programming.Cpp.enable) {
        environment.systemPackages = with pkgs; [
            gcc
            glibc
            clang-tools
        ];
    })
    (lib.mkIf config.programming.Cpp.enable {
        environment.systemPackages = with pkgs; [
        ];
    })
    ];
}
