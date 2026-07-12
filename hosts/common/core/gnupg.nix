{ inputs, config, pkgs, ... }:
{
  programs.gnupg.agent = {
    enable = true;
    # enableSSHSupport = true;
  }; 
  hardware.gpgSmartcards.enable = true;
  programs.gnupg.agent.pinentryPackage = pkgs.pinentry-curses;
}
