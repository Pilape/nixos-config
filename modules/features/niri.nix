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

		    "Mod+D".spawn-sh = (lib.getExe self'.packages.myRofi) + " -show drun";
		    "Mod+X".spawn-sh = (lib.getExe self'.packages.myHyprlock);
		    
		    "Mod+H".focus-column-left = _:{};
		    "Mod+J".focus-workspace-down = _:{};
		    "Mod+K".focus-workspace-up = _:{};
		    "Mod+L".focus-column-right = _:{};

		    "Mod+1".focus-workspace = 1;
		    "Mod+2".focus-workspace = 2;
		    "Mod+3".focus-workspace = 3;
		    "Mod+4".focus-workspace = 4;
		    "Mod+5".focus-workspace = 5;
		    "Mod+6".focus-workspace = 6;
		    "Mod+7".focus-workspace = 7;
		    "Mod+8".focus-workspace = 8;
		    "Mod+9".focus-workspace = 9;

		};
	    };
	};
    };
}
