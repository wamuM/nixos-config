{pkgs, ...}:
{
    fonts.fontconfig.enable = true;
    fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
    ];
}
