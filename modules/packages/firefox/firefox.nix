{ inputs, ... }: {
    
    perSystem = { pkgs, ... }: {
        packages.firefox = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.firefox;

            flags = {
            };
        };
    };
}
