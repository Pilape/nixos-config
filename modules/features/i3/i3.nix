{ self, inputs, ... }: {

    flake.nixosModules.i3 = { pkgs, lib, ... }: {
        environment.systemPackages = with pkgs; [
            self.packages.${pkgs.stdenv.hostPlatform.system}.i3
        ];
    };

    perSystem = { pkgs, lib, ... }: {
        packages.i3 = pkgs.symlinkJoin {
            name = "i3";
            paths = [pkgs.i3];

            nativeBuildInputs = [pkgs.makeWrapper];
            postBuild = ''
                wrapProgram $out/bin/i3 \
                --add-flags '-c' \
                --add-flags '${./config}' \
                --add-flags '--replace' \
            '';
        };
    };

}
