{ self, inputs, ...}: {

    flake.nixosModules.network = { pkgs, ... }: {
	networking.networkmanager.enable = true;

        networking.firewall = {
            enable = true;
            # allowedUDPPorts = [ 25565 ];
        };
    };

}
