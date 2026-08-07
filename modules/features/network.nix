{ self, inputs, ...}: {

    flake.nixosModules.network = { pkgs, ... }: {
	networking.networkmanager.enable = true;
    };

}
