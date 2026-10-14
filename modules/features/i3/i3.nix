{ self, ... }: {

    flake.nixosModules.i3 = { pkgs, ... }: let
        selfpkgs = self.packages."${pkgs.system}";
    in { 
        services.xserver = {
            enable = true;
            xkb.layout = "no";

            libinput = {
                enable = true;

                mouse = {
                    accelProfile = "flat";
                };

                touchpad = {
                    accelProfile = "flat";
                };
            };

            windowManager.i3 = {
                enable = true;
                configFile = ./config;
            };

            excludePackages = with pkgs; [ xterm ];
        };

        environment.systemPackages = [
            pkgs.grim
        ];
    };
}
