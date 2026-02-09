{ pkgs, lib, config, ...}:
{
  options.bundle = {
	rofi.enable = lib.mkEnableOption "enables rofi";
  }; 
  config = lib.mkIf config.bundle.rofi.enable {
    programs.rofi = {
        enable = true;
        theme = "sidebar";
        font = "JetBrainsMono Nerd Font Mono";
        package = pkgs.rofi;
        modes = [
        "drun"
        "run"
        "window"
    ];
    extraConfig = {
      show-icons = true;
    };
  };
  };
}
