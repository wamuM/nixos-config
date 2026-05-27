{ inputs, config, pkgs, ... }:
{
environment.sessionVariables =  {
    TERMINAL="st";
};
environment.systemPackages = with pkgs; [
    (st.override {
        conf = builtins.readFile ../modules/st/config.def.h;
    })
    xclip
    fastfetch
    tmux
    pinentry-curses
    yazi
    at
];
}
