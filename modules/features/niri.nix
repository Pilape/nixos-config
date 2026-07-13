{ self, inputs, ... }: {
	perSystem = { pkgs, ... }: {
		packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
			settings = {
				input.keyboard = {
					xkb.layout = "no";
				};

				layout.gaps = 5;

				binds = {
					"Mods+Return".spawn-sh = lib.getExe pkgs.kitty;
					"Mod+Q".close-window = null;
				};
			};
		};
	};
};
