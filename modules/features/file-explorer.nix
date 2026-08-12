{ self, inputs, ...}: {

    flake.nixosModules.file-explorer = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            kdePackages.dolphin
        ];
    };

}
