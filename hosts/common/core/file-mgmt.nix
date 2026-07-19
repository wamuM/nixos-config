{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zip
    unzip

    # Encryption
    gocryptfs 

    #du but with curses interface
    ncdu

    fzf
    fd
    ripgrep
    stow
  ];
}
