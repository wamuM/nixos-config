{ pkgs, lib, config, ...}:
{
  options = {}; 
  config = {
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
			signingkey = config.user-config.pgpKey;
		};
		commit.gpgsign = config.user-config.pgpKey != null;
		gpg.program = "gpg";
	};
  };
}
