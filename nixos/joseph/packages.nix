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
    
    # Compression
    zip
    unzip

    # Set temporal events
    at

    # terminal
    (st.override {
        conf = builtins.readFile ../modules/st/config.def.h;
    })
    xclip
    fastfetch
    tmux
    pinentry-curses
    yazi

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
