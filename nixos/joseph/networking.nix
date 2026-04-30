{ inputs, config, pkgs, lib, ... }:
let 
    vpn-wamu-m-com-ip = lib.replaceStrings [ "\n" "\r" "\t" " " ] 
                                           [ ""   ""   ""   ""  ]
                       ( builtins.readFile (inputs.secrets + /vps-ip ) ) ;
    eduroam-password = lib.replaceStrings [ "\n" "\r" "\t" " " ] 
                                           [ ""   ""   ""   ""  ]
                       ( builtins.readFile (inputs.secrets + /eduroam-password ) ) ;
in 
{
  # Networking
  networking.hostName = "joseph";
  networking.wireless.enable = false;
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
            identity = "marcel.mula";
            anonymous_identity="cat.202010081836@upc.edu";
            password = "${eduroam-password}";
            phase2-auth = "pap";
            ca-cert = "/etc/secrets/eduroam-ca.pem";
        };
        ipv4.method = "auto";
        ipv6.method = "auto";
    };
  };

  networking.firewall = {
        allowedUDPPorts = [ 10220 ]; # wg0 port
  };
  networking.wireguard.interfaces = {
    # wg0 = {
    #     ips = ["10.22.0.4/24"];
    #     listenPort = 10220;
    #     privateKeyFile = "/etc/secrets/wg0.key";
    #
    #     peers = [ {
    #         publicKey = "W3jI//t8zt9yq8GJLDmKcLCEm3O4sSrS7xN5GhVKxAo="; 
    #         presharedKeyFile = "/etc/secrets/wg0.sym";
    #         allowedIPs = [ "10.22.0.0/24" ];
    #         endpoint = "${vpn-wamu-m-com-ip}:10220";
    #         persistentKeepalive = 25;
    #     } ];
    # };
  };
  networking.hosts = {
        "${vpn-wamu-m-com-ip}" = ["vpn.wamu-m.com"];
  }; 
  services.tailscale.enable = true;
  services.printing.enable = true;
  hardware.bluetooth.enable = true;

  environment.systemPackages = with pkgs; [
    openfortivpn
  ];
}  
