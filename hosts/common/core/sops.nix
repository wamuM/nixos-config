{ pkgs, inputs, config, ...}:
{
    imports = [
        inputs.sops-nix.nixosModules.sops
    ];

    sops = {
        defaultSopsFile = ../../../secrets/common.yaml;
        validateSopsFiles = false;

        age = {
            sshKeyPaths = [ "/etc/ssh/host" ];
            keyFile = "/var/lib/sops-nix/key.txt";
            generateKey = true;
        };
    };
}
