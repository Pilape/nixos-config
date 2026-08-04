{ self, inputs, ... }: {

    perSystem = { pkgs, lib, ... }: {
	packages.kitty = inputs.wrappers.lib.wrapPackage {
	    inherit pkgs;
            package = pkgs.kitty;

            runtimeInputs = [
                pkgs.nerd-fonts.hurmit
            ];

            flags = {
                "-c" = "${./kitty.conf}";
            };

	};

    };

}
