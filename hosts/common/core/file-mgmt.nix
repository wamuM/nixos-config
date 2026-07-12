{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zip
    unzip

    #du but with curses interface
    ncdu

    fzf
    fd
    ripgrep
    stow
  ];
}
