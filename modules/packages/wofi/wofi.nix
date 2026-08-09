{ self, inputs, ... }: {

    perSystem = { pkgs, self', ... }: {
        packages.wofi = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.wofi;
            
            flags = {
                "-c" = "${./config}";
            };
        };
    };

}
