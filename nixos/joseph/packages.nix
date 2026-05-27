{ inputs, config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  programs.slock.enable = true;

  environment.systemPackages = with pkgs; [
    home-manager

    # Games
    superTuxKart 

    # passwords
    keepassxc

    # multimedia
    mpv
    inkscape

    # gemini
    amfora
    
    # Compression
    zip
    unzip


    #nvim telescope
    fzf
    fd
    ripgrep

    # Only office
    onlyoffice-desktopeditors

    # Maths
    libqalculate

    # Modules
    stow
  ];
}
