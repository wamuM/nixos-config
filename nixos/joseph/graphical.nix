{ inputs, config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
	awesome
    xdotool
  ];
  services = {
  xserver = {
	enable = true;
    displayManager.startx.enable = true;
  };

  greetd = {
    enable = true;
    settings = {
      default_session = lib.mkForce {
        command = ''
        ${pkgs.tuigreet}/bin/tuigreet \
         --time \
		 --cmd 'startx' \
		 --greeting 'Welcome back!' \
		 --asterisks \
		 --remember 
         '';
        user = "greeter";
      };
    };
  };
  };
}
