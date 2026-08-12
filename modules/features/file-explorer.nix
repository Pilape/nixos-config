{ self, inputs, ...}: {

    flake.nixosModules.file-explorer = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            kdePackages.dolphin
        ];

        services.udisk2.enable = true;
    };

}
