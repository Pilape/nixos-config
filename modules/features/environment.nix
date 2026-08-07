{ self, inputs, ... }: {

    perSystem = { pkgs, self', ... }: { 
        packages.environment = let 
            selfpkgs = self'.packages;
        in inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            
            package = selfpkgs.fish;

            runtimeInputs = [
                selfpkgs.neovim
                pkgs.git
                pkgs.gh
                pkgs.fastfetch
            ];

        };

    };
}
