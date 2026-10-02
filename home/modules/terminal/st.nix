{ pkgs, lib, config, ...}:
let 
    # Add override
    st = pkgs.st;
in
{
  options = {}; 
  config = { 
    xdg = {
        desktopEntries = {
            st = {
                name = "st";
                genericName = "Terminal";
                comment = "Simple Terminal Emulator";
                exec = "${st}/bin/st";
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
    home.packages = [
        # TODO: Add override
        st 
    ];
};
}
