{ self, inputs, ... }: {

    perSystem = { pkgs, ... }: {
	packages.myRofi = inputs.wrapper-modules.wrappers.rofi.wrap {
	    inherit pkgs;

	    settings = {
	    	modes = [ "drun" ];
	    };

	    theme = "gruvbox-dark";
	};
    };

}
     

     

