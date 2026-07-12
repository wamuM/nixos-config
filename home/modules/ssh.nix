{ pkgs, lib, config, ...}:
{
  options.bundle = {
	ssh.enable = lib.mkEnableOption "enables SSH client";
  }; 
  config = lib.mkIf config.bundle.ssh.enable {
	programs.ssh.enable = true;
  };
}
