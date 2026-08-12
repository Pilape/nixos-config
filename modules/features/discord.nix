{ self, inputs, ...}: {

    flake.nixosModules.discord = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            discord
        ];

        xdg.portal.enable = true;
    };

}
