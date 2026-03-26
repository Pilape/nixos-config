{ config, pkgs, inputs, ... }:

{
    imports = [ 
        ./../hardware-configuration.nix # Include the results of the hardware scan.
        #inputs.home-manager.nixosModules.default
    ];

    # Bootloader.
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";
    boot.loader.grub.useOSProber = true;

    system.name = "puter";
    networking.hostName = "nixos"; # Define your hostname.

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/Oslo";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    # Configure keymap in X11
    services.xserver.xkb =  {
        layout = "n ";
        variant = "";
    };

    # Configure console keymap
    console.keyMap = "no";

    programs.fish.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.pilape =    {
        isNormalUser =  true;
        description =   "John NixOS";
        extraGroups =   [ "networkmanager" "wheel" ];
        packages =  with pkgs; [];
        shell = pkgs.fish;
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        neovim 
        wget
        fastfetch 
        git
        gh 
    ];

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;
    system.stateVersion = "25.11"; 
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
