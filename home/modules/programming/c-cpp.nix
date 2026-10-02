{ config, lib, pkgs, ...}:
{
home.packages = with pkgs; [
    gcc
    glibc
    clang-tools
];
}
