{ self, ... }: {

    flake.nixosModules.desktop = { pkgs, ... }: let 
        selfpkgs = self.packages."${pkgs.system}";
    in {

        imports = [ 
            self.nixosModules.neovim 
            # self.nixosModules.i3 
            self.nixosModules.kitty 
        ];

	services.displayManager.ly.enable = true;

        environment.systemPackages = [
            #wmname
            pkgs.ffmpeg
            pkgs.gtk3
        ];

        services.xserver = {
            enable = true;
            autorun = true;
        };

        xdg.portal.enable = true;
        xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr ];
        # xdg.portal.config.common.default = [ "gtk" ];
        # xdg.portal.xdgOpenUsePortal = true;

        programs.uwsm = {
            enable = true;

            waylandCompositors = {
                sway = {
                  prettyName = "Sway";
                  comment = "Sway compositor managed by UWSM";
                  binPath = "/run/current-system/sw/bin/sway";
                };
            };
        };

        programs.sway = {
            enable = true;
            package = selfpkgs.sway;

            xwayland.enable = true;
            wrapperFeatures.gtk = true;
        };

        environment.sessionVariables = rec {
            QT_QPA_PLATFORM = "wayland";
            _JAVA_AWT_WM_NOREPARENTING = 1;
        };

        users.defaultUserShell = selfpkgs.environment;
    };

    # perSystem = { pkgs, self', ... }: {
    #     packages.desktop = let
    #         selfpkgs = self'.packages; 
    #     in inputs.wrappers.lib.wrapPackage {
    #         inherit pkgs;
    #
    #         package = selfpkgs.sway;
    #
    #         runtimeInputs = [
    #             selfpkgs.kitty
    #         ];
    #     };
    # };

}
