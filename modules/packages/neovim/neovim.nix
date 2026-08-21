{ self, inputs, ... }: {

    flake.nixosModules.neovim = { pkgs, lib, ... }: {
        programs.neovim = {
            enable = true;
            defaultEditor = true;
            package = self.packages.${pkgs.stdenv.hostPlatform.system}.neovim;
        };

        # LSP
        environment.systemPackages = with pkgs; [
            pkgs.nixd
            pkgs.ccls
            pkgs.lua-language-server
            pkgs.asm-lsp
        ];
    };

    perSystem = { pkgs, lib, ... }: {
        packages.neovim = let
            packageName = "neovim-plugins";

            startPlugins = [
                pkgs.vimPlugins.telescope-nvim # Does not tell you dependencies (rude)
                pkgs.vimPlugins.plenary-nvim
                pkgs.vimPlugins.nvim-treesitter.withAllGrammars
                pkgs.vimPlugins.everforest
                pkgs.vimPlugins.blink-cmp
                pkgs.vimPlugins.lualine-nvim
                pkgs.vimPlugins.moveline-nvim
                pkgs.vimPlugins.autoclose-nvim
                pkgs.vimPlugins.gitsigns-nvim
            ];

            foldPlugins = builtins.foldl' (
                acc: next:
                    acc
                    ++ [
                        next
                    ]
                    ++ (foldPlugins (next.dependencies or []))
            ) [];

            startPluginsWithDeps = lib.unique (foldPlugins startPlugins);

            packpath = pkgs.runCommandLocal "packpath" {} ''
                mkdir -p $out/pack/${packageName}/{start,opt}

                ${
                    lib.concatMapStringsSep
                    "\n"
                    (plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/start/${lib.getName plugin}")
                    startPluginsWithDeps
                }
            '';
        in
        pkgs.symlinkJoin {
	    name = "nvim";
	    paths = [pkgs.neovim-unwrapped];
	    nativeBuildInputs = [pkgs.makeWrapper];

            meta = pkgs.neovim.unwrapped.meta;

	    postBuild = ''
		wrapProgram $out/bin/nvim \
		--add-flags '-u' \
		--add-flags '${./init.lua}' \
                --add-flags '--cmd' \
                --add-flags "'set packpath^=${packpath} | set runtimepath^=${packpath}'" \
                --set-default NVIM_APPNAME neovim-custom
	    '';

            passthru = {
                inherit packpath;
            }; 
	};
    };

}

