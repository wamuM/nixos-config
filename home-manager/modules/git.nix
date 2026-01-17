{ pkgs, lib, config, ...}:
{
  options.bundle.git = {
	enable = lib.mkEnableOption "Enables git";
  }; 
  config = lib.mkIf config.bundle.git.enable {
	programs.git.enable = true;
	programs.git.settings = {
		core = {
			editor = config.user-config.editor;
			pager = config.user-config.pager;
		};
		pull.rebase = true;
		user = {
			email = config.user-config.email;
			name = config.user-config.name;
			signingkey = config.user-config.pgp-key;
		};
		commit.gpgsign = config.user-config.pgp-key != null;
		gpg.program = "gpg";
	};
  };
}
