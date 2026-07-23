{ self, inputs, ... }: {

    perSystem = { pkgs, lib, ... }: {
	packages.myKitty = inputs.wrapper-modules.wrappers.kitty.wrap {
	    inherit pkgs;

	    settings = {
		shell = lib.getExe pkgs.fish;
		font_family = "hurmit";
		#font_family = flake.nixosModules.hurmit.name;
	    };

	};

    };

}
