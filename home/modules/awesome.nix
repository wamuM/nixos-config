{ pkgs, lib, config, ...}:
{
options = {};
config = {
    home.file.".xinitrc".source = ../../files/awesome/xinitrc;

    home.sessionPath = lib.mkAfter ["$HOME/.local/bin"];
    home.file.".local/bin" = {
        source = ../../files/awesome/bin;
        recursive = true;
    };

    home.file.".config/rofi/scripts".source = ../../files/rofi_scripts;

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

    home.file."Pictures/Screenshots/.keep".text = "";
    services.flameshot = {
        enable = true;
        settings = {
            General = {
                uiColor = "#FFFF00";
                contrastUiColor = "#000000";
                disabledTrayIcon = true;
                showDesktopNotification = true;
                savePath = "${config.home.homeDirectory}/Pictures/Screenshots";
                filenamePattern = "%Y-%m-%d_%H-%M-%S";
                savePathFixed = true;
            };
        };
    };
    
    # fcitx5 as input method
	i18n.inputMethod = {
		type = "fcitx5";
		enable = true;
		fcitx5.addons = with pkgs; [
			rime-data
			fcitx5-rime
			fcitx5-gtk
			qt6Packages.fcitx5-chinese-addons
			fcitx5-tokyonight
		];
	};


    # network-manager-applet
    services.network-manager-applet.enable = true;
};
}
