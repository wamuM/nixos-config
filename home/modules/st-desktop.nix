{ pkgs, lib, config, ...}:
{
  options.bundle = {
	st-desktop.enable = lib.mkEnableOption "enables rofi";
  }; 
  config = lib.mkIf config.bundle.st-desktop.enable { 
    xdg = {
        desktopEntries = {
            st = {
                name = "st";
                genericName = "Terminal";
                comment = "Simple Terminal Emulator";
                exec = "${pkgs.st}/bin/st";
                terminal = false;
                categories = [ "System" "TerminalEmulator" ];
                icon = "utilities-terminal";
            };
        };
        terminal-exec = {
            enable = true;
            settings = {
                default = ["st.desktop"];
            };
        };
    };
};
}
