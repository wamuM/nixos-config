{ inputs, config, pkgs, ... }:
{
environment.sessionVariables =  {
    TERMINAL="st";
};
environment.systemPackages = with pkgs; [
    # TODO: Add override
    st
];
}
