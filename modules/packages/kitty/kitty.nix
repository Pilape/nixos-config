{ self, inputs, ... }: {

    perSystem = { pkgs, lib, ... }: {
	packages.kitty = inputs.wrappers.lib.wrapPackage {
	    inherit pkgs;
            package = pkgs.kitty;

            flags = {
                "-c" = "${./kitty.conf}";
            };

	};

    };

}
