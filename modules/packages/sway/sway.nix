{ self, inputs, ... }: {

    perSystem = { pkgs, self', ... }: {
        packages.sway = let 
            selfpkgs = self'.packages;
        in inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.sway;

            runtimeInputs = [ 
                pkgs.sway # For some reason (idk why yet) i need to install sway alongside sway for things like swaybar :(
                pkgs.i3status
                pkgs.swaylock

                pkgs.grim
                selfpkgs.tofi
            ];
            
            flags = {
                "-c" = "${./config}";
            };
        };
    };

}
