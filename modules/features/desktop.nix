{ self, inputs, ... }: {

    flake.nixosModules.desktop = { pkgs, ... }: let 
        selfpkgs = self.packages."${pkgs.system}";
    in {

        imports = [ self.nixosModules.neovim ];

	services.displayManager.ly.enable = true;

        fonts.packages = with pkgs; [
            hermit
        ];

        programs.sway = {
            enable = true;
            package = selfpkgs.desktop;
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
