{ self, inputs, ... }: {
	flake.nixosModules.puterPrimeConfiguration = { config, lib, pkgs, ... }: {
		  imports =
		    [ 
		      self.nixosModules.puterPrimeHardware
		    ];

		  # Use the systemd-boot EFI boot loader.
		  boot.loader.systemd-boot.enable = true;
		  boot.loader.efi.canTouchEfiVariables = true;

		  networking.hostName = "i-use-nixos-btw"; # Define your hostname.

		  # Configure network connections interactively with nmcli or nmtui.
		  networking.networkmanager.enable = true;

		  # Set your time zone.
		  time.timeZone = "Europe/Oslo";

			  # Select internationalisation properties.
		  i18n.defaultLocale = "en_US.UTF-8";
		  console = {
		    font = "Lat2-Terminus16";
		    #keyMap = "no";
		    useXkbConfig = true; # use xkb.options in tty.
		  };

		  # Enable sound.
	          #services.pulseaudio.enable = true;

		  # Enable touchpad support (enabled default in most desktopManager).
		  # services.libinput.enable = true;

		  # Define a user account. Don't forget to set a password with ‘passwd’.
		  users.users.pilape = {
		    isNormalUser = true;
		    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
		    packages = with pkgs; [
			fastfetch 
	    	    ];
	  	  };

	  	programs.firefox.enable = true;

	  	# List packages installed in system profile.
	  	# You can use https://search.nixos.org/ to find more packages (and options).
		environment.systemPackages = with pkgs; [
	    		neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	    		wget 
	    		git 
	    		gh 
	  	];

		nix.settings.experimental-features = [ "nix-command" "flakes" ];

	  	system.stateVersion = "25.11"; # Did you read the comment?
	};
}
