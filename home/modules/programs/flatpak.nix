{ pkgs, ... }:
{
  systemd.user.enable = true;
  services.flatpak = {
    enable = true;
    # remotes = [];

    uninstallUnused = true;
    update.auto = {
        enable = true;
        onCalendar = "weekly"; # Default value
    };
  };
}
