{ pkgs, lib, config, ...}:
{
    imports = [
        ./flatpak.nix
    ];
    config = {
        services.flatpak = {
            packages = ["flathub:app/org.opencpn.OpenCPN/x86_64/stable"];
            overrides = {
            "org.opencpn.OpenCPN" = {
#                devices = [ "all" ];
#                filesystems = [ "/dev/ttyUSB*:rw" "/dev/ttyACM*:rw" ];
            };
            };
        };
    };
}
