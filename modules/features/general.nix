{ self, inputs, ...}: {

    flake.nixosModules.general = { pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;

        console.keyMap = "no";

        # Allow execution of dynamically linked executables (sometimes)
        programs.nix-ld = {
            enable = true;
            libraries = with pkgs; [
                # All of these are needed for m5burner
                glib
                nss
                nspr
                atk
                cups
                dbus
                libdrm
                gtk3
                pango
                cairo
                gdk-pixbuf
                libx11
                libxcomposite
                libxdamage
                libxext
                libxfixes
                libxrandr
                libgbm
                expat
                libxcb
                libxkbcommon
                alsa-lib
                # Add libraries for these sorts of programs here
            ];
        };

        nix.settings.experimental-features = [ "nix-command" "flakes" ];
	system.stateVersion = "25.11"; # Did you read the comment?
    };

}

