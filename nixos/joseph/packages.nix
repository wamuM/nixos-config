{ inputs, config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  programs.slock.enable = true;

  environment.systemPackages = with pkgs; [
    home-manager

    # Games
    supertuxkart

    # passwords
    keepassxc
    gocryptfs

    # multimedia
    mpv
    inkscape

    # gemini
    amfora
    
    # Compression & file management
    zip
    unzip
    ncdu


    #nvim telescope
    fzf
    fd
    ripgrep

    # Office Suit
    # onlyoffice-desktopeditors # Discarded because it's using Microsoft formats as defaults and most stuff it does it poorly

    # Maths
    libqalculate

    # Modules
    stow
  ];
}
