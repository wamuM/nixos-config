{ inputs, config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
	awesome
  ];
  services = {
  xserver = {
	enable = true;
	displayManager.startx.enable = lib.mkForce true;
  };

  greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time \
		 --cmd 'startx' \
		 --greeting 'Welcome back!' \
		 --asterisks \
		 --remember \
		 --user wamu-m ";
        user = "greeter";
      };
    };
  };
  };
}
