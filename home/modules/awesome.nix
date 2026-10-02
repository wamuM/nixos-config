{ pkgs, lib, config, ...}:
{
options = {};
config = {
    home.file.".xinitrc".source = ../../files/awesome/xinitrc;

    home.sessionPath = lib.mkAfter ["$HOME/.local/bin"]
    home.file.".local/bin" = ../../files/awesome/bin;

    home.file.".config/rofi/scripts" = ../../files/rofi_scripts;
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
