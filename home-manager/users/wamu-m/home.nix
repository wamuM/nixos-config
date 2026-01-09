{config, pkgs, ...}:
{
  imports = [ ../../modules/bundle.nix ];
  options = {};
  config = {
   home.username = "wamu-m";
   home.homeDirectory = "/home/wamu-m";

   user-config.name = "wamu_M";
   user-config.email = "contact@wamu-m.com";
   user-config.pgp-key = "A1F226C3D73BFED11DDE9F921E2E4417F8B2D426";
   
   user-config.editor = "nvim";


   git.enable = true;
   
   bash.enable = true;

   programs.gpg.enable = true;
   programs.gpg.homedir = "${config.xdg.dataHome}/gnupg";

   programs.neovim.enable = true;

   home.packages = [];
   home.file = {};

   home.stateVersion = "25.11";
   programs.home-manager.enable = true;
  };
}
