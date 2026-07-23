{ self, inputs, ... }: {

    flake.nixosModules.hurmitFont = { pkgs, ... }: {
	pkgs.nerdfonts.hurmit.enable = true;

    };

}
