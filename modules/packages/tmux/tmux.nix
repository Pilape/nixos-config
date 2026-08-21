{ self, inputs, ... }: {

    perSystem = { pkgs, ... }: {
        packages.tmux = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;

            package = pkgs.tmux;

            flags = {
                "-f" = "${./.tmux.conf}";
            };

        };
    };

}
