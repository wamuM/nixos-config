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
		user = {
			email = config.user-config.email;
			name = config.user-config.name;
			signingkey = config.user-config.pgpKey;
		};

		gpg.program = "gpg";
		commit.gpgsign = config.user-config.pgpKey != null;

        init.defaultBranch = "main";
		pull.rebase = true;
        rebase.autoStash = true;
        push.autoSetupRemote = true;
	};
  };
}
