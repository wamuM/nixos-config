{config, pkgs, lib, ...}:
{
imports = [ 
    ./modules/user-config.nix
    ./modules/dotfiles.nix

    ./modules/awesome.nix

    ./modules/programs/nvim.nix
    ./modules/programs/git.nix
    ./modules/programs/ssh.nix

    ./modules/terminal/bash.nix
    ./modules/terminal/tmux.nix
    ./modules/terminal/st.nix

    ./modules/media/pdf.nix
    ./modules/media/office.nix
    ./modules/media/vectors.nix
    ./modules/media/3dprinting.nix

    ./modules/games
    ./modules/programming 

    ./modules/browsers/firefox.nix
    ./modules/browsers/gemini.nix
    ./modules/browsers/thunderbird.nix
];
options = {};
config = {
    home.username = "wamu-m";
    home.homeDirectory = "/home/wamu-m";

    user-config.name = "wamu_M";
    user-config.email = "contact@wamu-m.com";
    user-config.pgpKey = "A1F226C3D73BFED11DDE9F921E2E4417F8B2D426";
    user-config.editor = "nvim";

    programs.gpg.enable = true;
    programs.gpg.homedir = "${config.xdg.dataHome}/gnupg";


    dotfiles = {
        enable = false;
        repo_url = "git@github.com:wamuM/dotfiles";
        directory = "${config.home.homeDirectory}/Dotfiles";
        update = false;
        ref = "origin/master";
        modules = [];
    };

    home.file = {};
    
    # Nothing bellow this line please
    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
};
}
