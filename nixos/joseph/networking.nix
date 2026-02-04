{ inputs, config, pkgs, lib, ... }:
let 
    vpn-wamu-m-com-ip = lib.replaceStrings [ "\n" "\r" "\t" " " ] 
                                           [ ""   ""   ""   ""  ]
                       ( builtins.readFile (inputs.secrets + /vps-ip ) ) ;
in 
{
  # Networking
  networking.hostName = "joseph";
  networking.wireless.enable = false;
  networking.networkmanager.enable = true;

  networking.firewall = {
        allowedUDPPorts = [ 10220 ]; # wg0 port
  };
  networking.wireguard.interfaces = {
    wg0 = {
        ips = ["10.22.0.4/24"];
        listenPort = 10220;
        privateKeyFile = "/etc/secrets/wg0.key";

        peers = [ {
            publicKey = "W3jI//t8zt9yq8GJLDmKcLCEm3O4sSrS7xN5GhVKxAo="; 
            presharedKeyFile = "/etc/secrets/wg0.sym";
            allowedIPs = [ "10.22.0.0/24" ];
            endpoint = "${vpn-wamu-m-com-ip}:10220";
            persistentKeepalive = 25;
        } ];
    };
  };
  networking.hosts = {
        "${vpn-wamu-m-com-ip}" = ["vpn.wamu-m.com"];
  }; 
  services.tailscale.enable = true;
  services.printing.enable = true;
  hardware.bluetooth.enable = true;
}  
