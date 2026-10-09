{ inputs, ... }: {
    
    perSystem = { pkgs, ... }: {
        packages.i3 = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.i3;

        };
    };
}
