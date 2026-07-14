{ self, inputs, ... }: {

    flake.nixosModules.niri = { pkgs, lib, ... }: {
	programs.niri = {
	    enable = true;
	    package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
	};
    };

    perSystem = { pkgs, lib, self', ... }: {
	packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
	    inherit pkgs;

	    settings = {
		spawn-at-startup = [
		    (lib.getExe self'.packages.myWaybar)
		];

		xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

		input.keyboard.xkb.layout = "no";

		layout.gaps = 5;

		binds = {
		    "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;
		    "Mod+Shift+Q".close-window = _:{};
		    
		    "Mod+H".focus-column-left = _:{};
		    "Mod+J".focus-workspace-down = _:{};
		    "Mod+K".focus-workspace-up = _:{};
		    "Mod+L".focus-column-right = _:{};
		};
	    };
	};
    };
}
