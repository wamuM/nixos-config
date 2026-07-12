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
        stash = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = ''
                Stash changes before updating
            '';
        };
        modules = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [];
            description = "List of modules to enable for this user";
        };
    };
    config = lib.mkIf cfg.enable {
        assertions = [
            {
                assertion = cfg.stash -> cfg.update;
                message = ''
                    .stash can only be enabled when .update is enabled
                '';
            }
        ];
        home.activation.deploy_dotfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        set -euo pipefail 
        repoDir="${cfg.directory}"

        if [ ! -d "$repoDir/.git" ]; then
            ${gitSSH}/bin/git clone ${cfg.repo_url} "$repoDir"
        fi

        export PATH="${pkgs.stow}/bin:$PATH"
        "$repoDir"/dotfiles clear

        ${lib.optionalString cfg.update ''
        ${gitSSH}/bin/git -C "$repoDir" fetch --all --tags --prune
        ${lib.optionalString cfg.stash ''
        if ! ${gitSSH}/bin/git -C "$repoDir" diff --quiet || \
           ! ${gitSSH}/bin/git -C "$repoDir" diff --cached --quiet || \
           [ -n "$(${gitSSH}/bin/git -C "$repoDir" ls-files --others --exclude-standard)" ]; then
                ${gitSSH}/bin/git -C "$repoDir" stash push -u \
                -m "Nix dotfiles activation $(date +%Y-%m-%d-%H%M%S)"
        fi
        ''}
        ${gitSSH}/bin/git -C "$repoDir" checkout "${cfg.ref}"
        ''}


        "$repoDir"/dotfiles apply ${lib.concatStringsSep " " cfg.modules} 
        '';
    };
}
