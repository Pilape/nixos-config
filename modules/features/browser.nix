{ self, ...}: {

    flake.nixosModules.browser = { pkgs, ... }: let 
        selfpkgs = self.packages."${pkgs.system}";
    in {
	programs.firefox = {
            enable = true;
        };

        environment.variables.GTK_USE_PORTAL = "1";
    };

}
