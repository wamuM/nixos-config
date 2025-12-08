{pkgs, config, lib,...}:
{
options = {
	user-config.editor = lib.mkOption {
		type = lib.types.str;
		default = "nano";
		description = "The prefered terminal editor by the user";
	};
	user-config.visual = lib.mkOption {
		type = lib.types.str;
		description = "The pefered desktop app editor by the user";
	};
	user-config.pager = lib.mkOption {
		type = lib.types.str;
		default = "less";
		description = "The prefered pager by the user";
	};
	user-config.email = lib.mkOption {
		type = lib.types.str;
		description = "The user's email address";
	};
	user-config.name  = lib.mkOption {
		type = lib.types.str;
		description = "The user's name";
	};
	user-config.pgp-key = lib.mkOption {
		type = lib.types.str;
		description = "The user's main pgp key";
	};
};
config = {
	home.sessionVariables = {
		EDITOR = config.user-config.editor;
		# VISUAL = config.user-config.visual;
		PAGER = config.user-config.pager;
	};
};
}

