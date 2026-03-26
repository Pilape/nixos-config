{
    description = "A somewhat basic flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        nvf = {
	    url = "github:notashelf/nvf";
	    inputs.nixpkgs.follows = "nixpkgs";
	};
	 #home-manager = {
	     #url = "github:nix-community/home-manager";
	     #inputs.nixpkgs.follows = "nixpkgs";
	#};
    };

    outputs = { self, nixpkgs, nvf, ... }@inputs: {
        # System config
    	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	    specialArgs = {inherit inputs;};
            modules = [
	        ./configuration.nix
		./nvf-configuration.nix
		#inputs.home-manager.nixosModules.default
            ];
	};

    };
}
