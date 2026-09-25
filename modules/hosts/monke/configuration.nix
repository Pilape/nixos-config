{ self, inputs, ... }: {
    flake.nixosModules.monkeConfiguration = { config, lib, pkgs, ... }: {
        imports = [ 
	    self.nixosModules.monkeHardware
	];

        # Use the systemd-boot EFI boot loader.
        boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "nixos-user";
    };
}
