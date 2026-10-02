{config, pkgs, lib, ...}:
{
options= {};
config = {
   programs.bash = {
   	enable = true;
	enableCompletion = true;
	initExtra = ''
    		if [ -f "$HOME/.bashrc.d.sh" ];then
        		source ~/.bashrc.d.sh
    		fi'';
	historyControl = ["ignoreboth"];
	historyFileSize = 10000;
	historySize = 1000;
	shellOptions = [
		"histappend"
		"globstar"
		"-cdable_vars"
		"cdspell"
		"checkwinsize"
		"cmdhist"
		"-direxpand"
		"dirspell"
		"extglob"
		"nullglob"
		"checkjobs"
	];
   };
   dotfiles.modules  = lib.mkAfter [ "bashrc.d" "jump" "drawer"]
};
}
