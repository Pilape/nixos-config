{ config, pkgs, ... }:
{
    imports = [ ./nvf-configuration.nix ];

    home.username = "pilape";
    home.homeDirectory = "/home/pilape";

    home.stateVersion = "18.09";
}
