{ self, inputs, ... }: {

    flake.nixosModules.desktop = { pkgs, lib, ... }: let 
        selfpkgs = self.packages."${pkgs.system}";
    in {

        imports = [ self.nixosModules.neovim ];

	services.displayManager.ly.enable = true;

        #environment.systemPackages = with pkgs; [
        #    wmname
        #];

        fonts.packages = with pkgs; [
            hermit
        ];

        programs.sway = {
            enable = true;
            package = selfpkgs.desktop;

            xwayland.enable = true;
            wrapperFeatures.gtk = true;
        };

        environment.sessionVariables = rec {
            QT_QPA_PLATFORM = "wayland";
            _JAVA_AWT_WM_NOREPARENTING = 1;
        };

        users.defaultUserShell = selfpkgs.environment;
    };

    perSystem = { pkgs, self', ... }: {
        packages.desktop = let
            selfpkgs = self'.packages; 
        in inputs.wrappers.lib.wrapPackage {
            inherit pkgs;

            package = selfpkgs.sway;

            runtimeInputs = [
                selfpkgs.kitty
            ];
        };
    };

}
