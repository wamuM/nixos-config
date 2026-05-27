{ pkgs, lib, config, ...}:
{
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
}
