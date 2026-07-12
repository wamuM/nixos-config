{ inputs, config, pkgs, lib, ... }:
let 
    eduroam-password = "password";
    eduroam-identity = "marcel.mula";
    eduroam-anon-identity = "cat.202010081836@upc.edu";
in 
{
  networking.networkmanager.enable = true;
  # Eduroam
  networking.networkmanager.ensureProfiles.profiles = {
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
            identity = "${eduroam-identity}";
            anonymous_identity="${eduroam-anon-identity}";
            password = "${eduroam-password}";
            phase2-auth = "pap";
            ca-cert = "/etc/secrets/eduroam-ca.pem";
        };
        ipv4.method = "auto";
        ipv6.method = "auto";
    };
  };
}  
