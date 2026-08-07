{ self, inputs, ...}: {

    flake.nixosModules.general = { pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;

        nix.settings.experimental-features = [ "nix-command" "flakes" ];
	system.stateVersion = "25.11"; # Did you read the comment?
    };

}

