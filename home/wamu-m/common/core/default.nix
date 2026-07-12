{config, pkgs, lib, ...}:
{
  imports = [ 
    ../../../modules
  ]; 
  options = {};
  config = {
   home.username = "wamu-m";
   home.homeDirectory = "/home/wamu-m";

   user-config.name = "wamu_M";
   user-config.email = "contact@wamu-m.com";
   user-config.pgp-key = "A1F226C3D73BFED11DDE9F921E2E4417F8B2D426";
   user-config.editor = "nvim";

   programs.gpg.enable = true;
   programs.gpg.homedir = "${config.xdg.dataHome}/gnupg";

   programs.neovim.enable = true;

   bundle.rofi.enable = true;

   bundle.dotfiles = {
         enable = false;
         repo_url = "git@github.com:wamuM/dotfiles";
         directory = "${config.home.homeDirectory}/Dotfiles";
         update = false;
         ref = "origin/master";
         modules = ["auto-tmux" "bashrc.d" "jump" "tmux" "awesome" "nvim"];
   };

   home.file = {};

   bundle.firefox.enable = true;

   services.network-manager-applet.enable = true;
   bundle.input-method.enable = true;
    
   # Nothing bellow this line please
   home.stateVersion = "26.05";
   programs.home-manager.enable = true;
  };
}
