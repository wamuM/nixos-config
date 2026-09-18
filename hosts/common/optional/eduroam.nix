{ inputs, config, pkgs, lib, ... }:
let 
    eduroam-password = "password";
    eduroam-identity = "marcel.mula";
    eduroam-anon-identity = "cat.202010081836@upc.edu";

    eduroam-sops-file = ../../../secrets/users/marcel.mula.yaml;
    eduroam-ca-file = ../../../files/eduroam-ca.pem;
in 
{
  sops.secrets."eduroam/env" = {
    sopsFile = ${eduroam-sops-file};
  };

  environment.etc."eduroam/ca.pem".source = ${eduroam-ca-file};

  networking.networkmanager.enable = true;
  # Eduroam
  networking.networkmanager.ensureProfiles.profiles = {
    environmentFiles = [
        config.sops.secrets."eduroam/env".path
    ];

    eduroam = {
        connection = {
            id = "eduroam";
            type = "wifi";
            interface-name = "wlp0s20f3";
        };
        wifi = {
            mode = "infrastructure";
            ssid = "eduroam";
        };
        wifi-security = {
            key-mgmt = "wpa-eap";
        };
        "802-1x" = {
            eap = "ttls";
            identity = "$EDUROAM_IDENTITY";
            anonymous_identity="$EDUROAM_ANON_IDENTITY";
            password = "$EDUROAM_PASSWORD";
            phase2-auth = "pap";
            ca-cert = "/etc/secrets/eduroam-ca.pem";
        };
        ipv4.method = "auto";
        ipv6.method = "auto";
    };
  };
}  
