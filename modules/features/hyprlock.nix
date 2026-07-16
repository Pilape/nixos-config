{ self, inputs, ... }: {

    perSystem = { pkgs, ... }: {
	packages.myHyprlock = inputs.wrapper-modules.wrappers.hyprlock.wrap {
	    inherit pkgs;

	    settings = {
	        general = {
    		    grace = 5;
    		    hide_cursor = true;
    		    ignore_empty_input = true;
  		};

  		background = [
    		    {
      			path = "screenshot";
      			blur_passes = 2;
      			blur_size = 2;
			brightness = 0.5;
    		    }
  		];

		input-field = [
    		    {
      			size = "200, 50";
      			position = "0, -80";
		        monitor = "";
      			dots_center = true;
      			fade_on_empty = false;
			rounding = 0;
    		    }
  		];

	    };
	};
    };
}
