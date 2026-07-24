{ inputs, config, pkgs, ... }:
let
    hostname = config.networking.hostName;
    file = ../../../secrets/hosts/${hostname}.yaml;
in {
    sops.secrets."pronaos/priv_key" = {
        sopsFile = file;
    };
    sops.secrets."pronaos/pres_key" = {
        sopsFile = file;
    };

    networking.wg-quick.interfaces.wg-pronaos = {
        address = ["10.22.2.2/32" "fdcc:ad94:bacf:61a3::2/128"];

        privateKeyFile = config.sops.secrets."pronaos/priv_key".path;

        peers = [
            {
                publicKey = "QAI1Nuo2mvWmEJgYUpyeyi7nEBX+m5QquPDLoUMymU8=";
                presharedKeyFile = config.sops.secrets."pronaos/pres_key".path;
                allowedIPs = ["10.22.0.0/16"];
                endpoint = "pronaos.wamu-m.com:10100";
            }
        ];

    };
}
