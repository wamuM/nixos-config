{pkgs, inputs, lib, config, ...}:
{
    networking.hostName = lib.mkForce "joseph";
    imports = [
        ./hardware-configuration.nix

        ../modules/docker.nix
        ../modules/brightnessctl.nix

        ../modules/sessions/awesome.nix

        ../modules/networks/eduroam.nix
        ../modules/networks/pronaos.nix
        ../modules/networks/upclink.nix

        ../modules/steam.nix
    ];

    programs.nm-applet.enable = true;

    # Boot
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.initrd.luks.devices."luks-544d2698-4af2-4550-b08e-a19140cc0e4c".device = "/dev/disk/by-uuid/544d2698-4af2-4550-b08e-a19140cc0e4c";

    # copy.fail mitigation
    boot.extraModprobeConfig = "install algif_aead /bin/false";

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "26.05";
}
