{ self, inputs, ... }: {

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

