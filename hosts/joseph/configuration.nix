{pkgs, inputs, config, ...}:
let 
    enableList = list: builtins.listToAttrs (map (module: {
        name = module;
        value = {enable = true;};
    }) list);
in
{
    imports = [
        ./hardware-configuration.nix

        ../common/optional/audio.nix
        ../common/optional/brightness.nix

        ../common/optional/eduroam.nix
        ../common/optional/hostnames.nix

        ../common/optional/docker.nix
        ../common/optional/programming

        ../common/optional/graphical/awesome.nix
        ../common/optional/st.nix

        ../common/optional/gemini.nix

        ../common/optional/games/supertuxkart.nix
    ];
    # programming = enableList ["haskell" "rust" "C" "Cpp"];
    # Boot
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.initrd.luks.devices."luks-544d2698-4af2-4550-b08e-a19140cc0e4c".device = "/dev/disk/by-uuid/544d2698-4af2-4550-b08e-a19140cc0e4c";

    # copy.fail mitigation
    boot.extraModprobeConfig = "install algif_aead /bin/false";

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "26.05";
}
