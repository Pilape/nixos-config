{ self, inputs, ... }: {

    perSystem = { pkgs, self', ... }: { 
        packages.environment = let 
            selfpkgs = self'.packages;
        in inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            
            package = selfpkgs.fish;

            runtimeInputs = [
                selfpkgs.neovim
                selfpkgs.tmux
                pkgs.git
                pkgs.gh
                pkgs.fastfetch
                pkgs.wmname # Might be removed later, but sometimes I gotta run a command to fix Java application UI
            ];

        };

    };
}
