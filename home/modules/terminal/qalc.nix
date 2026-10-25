{ pkgs, lib, config, ...}:
let 
    qalc = pkgs.libqalculate;
in
{
  options = {}; 
  config = { 
    xdg = {
        desktopEntries = {
            qalc = {
                name = "Qalc";
                genericName = "Calculator";
                comment = "A terminal calculator";
                exec = "${qalc}/bin/qalc";
                terminal = true;
                categories = [ "Calculator" "Utility" ];
                icon = "none";
            };
        };
    };
    home.packages = [
        qalc
    ];
};
}
