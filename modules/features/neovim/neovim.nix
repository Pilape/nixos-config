{ self, inputs, ... }: {

    flake.nixosModules.neovim = { pkgs, lib, ... }: {
        environment.systemPackages = with pkgs; [
            self.packages.${pkgs.stdenv.hostPlatform.system}.neovim
        ];
    };

    perSystem = { pkgs, lib, ... }: {
       packages.neovim = pkgs.symlinkJoin {
	    name = "nvim";
	    paths = [pkgs.neovim-unwrapped];
	    nativeBuildInputs = [pkgs.makeWrapper];
	    postBuild = ''
		wrapProgram $out/bin/nvim \
		--add-flags '-u' \
		--add-flags '${./init.lua}'
	    '';
	    
	};
    };

}

