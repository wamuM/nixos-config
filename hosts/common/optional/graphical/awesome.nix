{ inputs, config, pkgs, lib, ... }:
{
  programs.slock.enable = true;
  environment.systemPackages = with pkgs; [
	awesome
    rofi
    python314
    xdotool
    xclip
    xkill
    arandr
    xrandr
  ];
  services = {
  xserver = {
    excludePackages = [ pkgs.xterm ];
	enable = true;
    displayManager.startx.enable = true;
  };
  greetd = {
    enable = true;
    useTextGreeter = true;
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
