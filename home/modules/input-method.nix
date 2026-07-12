{ pkgs, lib, config, ...}:
{
  options.bundle = {
	input-method.enable = lib.mkEnableOption "enables fcitx5";
  }; 
  config = lib.mkIf config.bundle.input-method.enable {
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
  };
}
