{config, pkgs, lib, ...}:
{
options.bundle = {
	bash.enable = lib.mkEnableOption "Enable the BASH defaults"; 
};
config = lib.mkIf config.bundle.bash.enable {
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
};
}
