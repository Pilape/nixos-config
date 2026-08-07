{ self, inputs, ... }: {

    perSystem = { pkgs, ... }: {
        packages.fish = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;

            package = pkgs.fish;

            flags = {
                "-C" = builtins.readFile ./init.fish;
            };

        };
    };

}
