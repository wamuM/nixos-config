{config, pkgs, ...}:
{
  home.username = "wamu-m";
  home.homeDirectory = "/home/wamu-m";

  home.packages = [];
  
  home.sessionVariables = {
	EDITOR = "nvim";
  };


  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
