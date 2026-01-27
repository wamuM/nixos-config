{ inputs, config, pkgs, ... }:
{
  # Networking
  networking.hostName = "joseph";
  networking.wireless.enable = false;
  networking.networkmanager.enable = true;

  services.tailscale.enable = true;
  services.printing.enable = true;
  hardware.bluetooth.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
	networkmanagerapplet
    alsa-utils
    brightnessctl
  ];
}  
