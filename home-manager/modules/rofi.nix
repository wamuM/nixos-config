{ pkgs, lib, config, ...}:
{
  options.bundle = {
	rofi.enable = lib.mkEnableOption "enables rofi";
  }; 
  config = lib.mkIf config.bundle.rofi.enable {
    home.file.".local/bin/launcher" = {
        text = ''
            #!/usr/bin/env bash
            rofi -show drun
        '';
        executable = true;
    };
    home.sessionPath = [
        "$HOME/.local/bin"
    ];
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
