{ self, inputs, ...}: {

    flake.nixosModules.user-pilape = { pkgs, ... }: {
        users.users.pilape = {
            isNormalUser = true;
            extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
            initialPassword = "1234";
        };
    };

}
