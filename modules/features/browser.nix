{ self, inputs, ...}: {

    flake.nixosModules.browser = { pkgs, ... }: {
	programs.firefox.enable = true;
    };

}
