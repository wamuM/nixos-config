{ inputs, config, pkgs, ... }:
{
environment.systemPackages = with pkgs; [
    #Screen stuff
    tmux
    pinentry-curses
  
    # utils
    at
    libnotify
    sox
    
    # Editor 
    vim
   
    # File management
    ncdu
    git
    stow

    # File search
    fzf
    fd
    ripgrep

    # Compression
    zip
    unzip

    # Encryption
    gocryptfs
];
}
