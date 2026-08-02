{ self, inputs, ... }: {

    flake.nixosConfigurations.puterPrime = inputs.nixpkgs.lib.nixosSystem {
	modules = [ 
	    self.nixosModules.neovim
	    self.nixosModules.puterPrimeConfiguration
	    self.nixosModules.niri
	];
    };
}
