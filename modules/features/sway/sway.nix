{ self, inputs, ... }: {

    perSystem = { pkgs, ... }: {
        packages.sway = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.sway;

            # For some reason (idk why yet) i need to install sway alongside sway for things like swaybar :(
            runtimeInputs = [pkgs.sway];
            
            flags = {
                "-c" = "${./config}";
            };
        };
    };

}
