{ inputs, config, pkgs, ... }:
{
  programs.firefox.enable = true;

  programs.git = {
 	enable = true;
	config = {
		user.name = "wamu_M";
 		user.email = "contact@wamu-m.com";
	};
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    pinentry-curses

    home-manager

    vim
    gnumake
    (st.override {
        conf = builtins.readFile ../modules/st/config.def.h;
    })
    xclip

    texlive.combined.scheme-medium
    
    jetbrains.idea-community

    kissat
    swi-prolog

    zip
    unzip

    fastfetch
    tmux

    python313
    python313Packages.dbus-python   
    
    stow
  ];

}
