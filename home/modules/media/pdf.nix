{ inputs, config, pkgs, ... }:
{
  gtk.enable = true;
  home.packages= with pkgs; [
    zathura
  ];
  xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "application/pdf" = [ "org.pwmt.zathura.desktop" ];
        };
  };
}  
