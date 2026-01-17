{ pkgs, lib, config, ... }:
let
  cfg = config.bundle.dotfiles;
  gitSSH = pkgs.git.override { withSsh = true; };
in 
{
    options.bundle.dotfiles = {
        enable = lib.mkEnableOption "Enables external dotfiles management";
        repo_url = lib.mkOption {
           type = lib.types.str;
           description = "dotfiles repository";
        };
        directory = lib.mkOption {
            type = lib.types.path;
            description = "Target directory where the dotfiles repo will live";
        };
        ref = lib.mkOption {
            type = lib.types.str;
            default = "origin/master";
            description = ''
                Gif ref to reset to.
                null means latests origin/main.
            '';
        };
	update = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = ''
			If the activation should automatically update the repo
		'';
	};
        modules = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [];
            description = "List of modules to enable for this user";
        };
    };
    config = lib.mkIf config.bundle.dotfiles.enable {
        bundle.git.enable = lib.mkDefault true; 
        home.activation.deploy_dotfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          set -euo pipefail 
          repoDir="${cfg.directory}"

          if [ ! -d "$repoDir/.git" ]; then
            ${gitSSH}/bin/git clone ${cfg.repo_url} "$repoDir"
          fi

	  export PATH="${pkgs.stow}/bin:$PATH"
          "$repoDir"/dotfiles clear
	  
	  ${ lib.optionalString cfg.update (''
          	${gitSSH}/bin/git -C "$repoDir" fetch --all --tags --prune
          	${gitSSH}/bin/git -C "$repoDir" reset --hard "${cfg.ref}"
	   '')}
           
          "$repoDir"/dotfiles apply ${lib.concatStringsSep " " cfg.modules} 
        '';
    };
}
