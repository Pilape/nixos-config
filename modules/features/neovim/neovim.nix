{ self, inputs, ... }: {

    flake.nixosModules.neovim = { pkgs, lib, ... }: {
        environment.systemPackages = with pkgs; [
            self.packages.${pkgs.stdenv.hostPlatform.system}.neovim
        ];
    };

    perSystem = { pkgs, lib, ... }: {
        packages.neovim = let
            packageName = "neovim-plugins";

            startPlugins = [
                pkgs.vimPlugins.plenary-nvim
                pkgs.vimPlugins.telescope-nvim
            ];

            packpath = pkgs.runCommandLocal "packpath" {} ''
                mkdir -p $out/pack/${packageName}/{start,opt}

                ${
                    lib.concatMapStringsSep
                    "\n"
                    (plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/start/${lib.getName plugin}")
                    startPlugins
                }
                '';
        in
        pkgs.symlinkJoin {
	    name = "nvim";
	    paths = [pkgs.neovim-unwrapped];
	    nativeBuildInputs = [pkgs.makeWrapper];

	    postBuild = ''
		wrapProgram $out/bin/nvim \
		--add-flags '-u' \
		--add-flags '${./init.lua}' \
                --add-flags '--cmd' \
                --add-flags "'set packpath^=${packpath} | set runtimepath^=${packpath}'" \
                --set-default NVIM_APPNAME spamton-neovim
	    '';

            passthru = {
                inherit packpath;
            }; 
	};
    };

}

