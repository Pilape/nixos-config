{ pkgs, lib, inputs, ... }:

{
    imports = [ inputs.nvf.nixosModules.default ];

    programs.nvf = {
	enable = true;

	settings.vim = {

	    theme = {
		    enable = true;
		    name = "solarized";
		    style = "dark-selenized-summer";
	    };
		statusline.lualine.enable = true;

		git.enable = true;
		telescope.enable = true;
        autocomplete.blink-cmp.enable = true;

		options = {
		    # Tabs
		    tabstop = 4;
		    shiftwidth = 4;

		};

		languages = {
            enableLSP = true;
            enableTreesitter = true;

            nix.enable = true;
	    };
     };
  };
}
