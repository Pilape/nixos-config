{ self, inputs, ...}: {

    flake.nixosModules.browser = { pkgs, ... }: {
	programs.firefox = {
            enable = true;
        }

        environment.variables.GTK_USE_PORTAL = "1";
    };

}
