{ pkgs, lib, config, ...}:
{
  options = {}; 
  config = {
    programs.neovim.enable = lib.mkForce false;
    home.packages = with pkgs; [
	    neovim
    ];
    dotfiles.modules = lib.mkAfter [ "nvim" ];
  };
}
