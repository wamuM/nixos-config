{ inputs, config, pkgs, ... }:
{
  programs.git = {
 	enable = true;
	config = {
		user.name = "wamu_M";
 		user.email = "contact@wamu-m.com";
	};
  };

  nixpkgs.config.allowUnfree = true;


  programs.slock.enable = true;

  environment.systemPackages = with pkgs; [
    home-manager
    
    # Developement
    vim
    gnumake

    # A (LaTeX)
    texlive.combined.scheme-medium
   
    # PROP (Java)
    jetbrains.idea-community

    # LI (SAT solvers)
    kissat
    swi-prolog

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
    fzf

    #python :d
    python313
    python313Packages.dbus-python   
   
    # Modules
    stow
    
  ];

}
