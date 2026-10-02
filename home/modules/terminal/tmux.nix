{config, pkgs, lib, ...}:
{
  options = {};
  config = {
    programs.tmux.enable = lib.mkForce false;    
    home.packages = with pkgs; [
        tmux
    ];
    dotfiles.modules = lib.mkAfter [ "tmux" "auto-tmux" ];
  };
}
