{ inputs, config, pkgs, ... }:
{
environment.systemPackages = with pkgs; [
    fastfetch
    tmux
    pinentry-curses
    yazi
    at
    vim
];
}
