{ self, inputs, ... }: {

    perSystem = { pkgs, ... }: {
        packages.tofi = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.tofi;

            flags = {
                "-c" = "${./config}";
            };

        };
    };

}
