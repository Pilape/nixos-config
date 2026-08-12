{ self, inputs, ... }: {

    flake.nixosConfigurations.puterPrime = inputs.nixpkgs.lib.nixosSystem {
	modules = [ 
	    self.nixosModules.puterPrimeConfiguration
            self.nixosModules.general
            self.nixosModules.user-pilape
	    self.nixosModules.desktop

            self.nixosModules.localization
            self.nixosModules.network
            self.nixosModules.browser

            self.nixosModules.bluetooth

            self.nixosModules.art
            self.nixosModules.gaming

            self.nixosModules.discord
            self.nixosModules.office
            self.nixosModules.file-explorer

	];
    };
}
