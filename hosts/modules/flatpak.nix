{ inputs, config, pkgs, ... }:
{
    services.flatpak.enable = true;

    xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
        config.common.default = "*";
    };

    environment.pathsToLink = [
        "/share/applications"
        "/share/xdg-desktop-portal"
    ];
}
