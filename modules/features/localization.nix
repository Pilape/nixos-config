{ self, inputs, ...}: {

    flake.nixosModules.localization = { pkgs, ... }: {
        # Set your time zone.
        time.timeZone = "Europe/Oslo";

        # Select internationalisation properties.
        i18n.defaultLocale = "en_US.UTF-8";
    };

}

