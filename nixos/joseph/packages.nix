{ inputs, config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  programs.slock.enable = true;

  environment.systemPackages = with pkgs; [
    home-manager
    
    # Compression
    zip
    unzip

    # terminal
    (st.override {
        conf = builtins.readFile ../modules/st/config.def.h;
    })
    xclip
    fastfetch
    tmux
    pinentry-curses

    #nvim telescope
    fzf
    fd
    ripgrep

    # Modules
    stow
    
  ];

}
