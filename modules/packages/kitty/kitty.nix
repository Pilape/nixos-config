{ self, inputs, ... }: {
    flake.nixosModules.kitty = { pkgs, ... }: let
        selfpkgs = self.packages."${pkgs.system}";
    in {
        environment.systemPackages = [ selfpkgs.kitty ];
        fonts.packages = with pkgs; [ hermit ];
    };

    perSystem = { pkgs, ... }: {
	packages.kitty = inputs.wrappers.lib.wrapPackage {
	    inherit pkgs;
            package = pkgs.kitty;

            flags = {
                "-c" = "${./kitty.conf}";
            };

	};

    };

}
