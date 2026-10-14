{ ... }: {

    flake.nixosModules.file-explorer = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            # kdePackages.dolphin
            nemo # File explorer
            pix # Image viewer
            vlc # The goat
            # persepolis
        ];

        # To automatically show connected usb storage devices
        services.udisks2.enable = true;

    };

}
