{ inputs, ... }: {

    perSystem = { pkgs, ... }: {
        packages.discord = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.discord;
            
            flags = {
                "--enable-features" = "UseOzonePlatform";
                "--ozone-platform" = "x11";
            };
        };
    };

}
