{ self, inputs, ...}: {

    flake.nixosModules.file-explorer = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            kdePackages.dolphin
            persepolis
        ];

        services.udisks2.enable = true;

    };

}
