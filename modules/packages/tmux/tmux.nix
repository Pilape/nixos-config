{ self, inputs, ... }: {

    perSystem = { pkgs, ... }: {
        packages.tmux = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;

            package = pkgs.tmux;

            runtimeInputs = with pkgs.tmuxPlugins; [
                resurrect
            ];

            flags = {
                "-f" = "${./.tmux.conf}";
            };

        };
    };

}
