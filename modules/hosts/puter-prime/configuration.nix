{ self, inputs, ... }: {
    flake.nixosModules.puterPrimeConfiguration = { config, lib, pkgs, ... }: {
        imports = [ 
	    self.nixosModules.puterPrimeHardware
	];

        # Use the systemd-boot EFI boot loader.
        boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "i-use-nixos-btw";
    };
}
