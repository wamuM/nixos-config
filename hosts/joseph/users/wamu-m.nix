{...}:
let 
    username = "wamu-m";
in
{
    users.users.${username} = {
            isNormalUser = true;
            extraGroups = ["wheel" "docker" "dialout"];
            home = "/home/${username}";
    };

    home-manager.users.${username} = import ../../../home/wamu-m.nix;
}
