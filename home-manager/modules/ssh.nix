{ pkgs, lib, config, ...}:
{
  options = {
	ssh.enable = lib.mkEnableOption "enables SSH client";
  }; 
  config = lib.mkIf config.ssh.enable {
	programs.ssh.enable = true;
  };
}
