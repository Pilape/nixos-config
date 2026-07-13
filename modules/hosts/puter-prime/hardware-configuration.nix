{ self, inputs, ... }: {

	flake.nixosModules.puterPrimeHardware = { config, lib, pkgs, modulesPath, ... }: {

	  imports =
	    [ (modulesPath + "/installer/scan/not-detected.nix")
	    ];

	  boot.initrd.availableKernelModules = [ "xhci_pci" "vmd" "nvme" "uas" "sd_mod" ];
	  boot.initrd.kernelModules = [ ];
	  boot.kernelModules = [ "kvm-intel" ];
	  boot.extraModulePackages = [ ];

	  fileSystems."/" =
	    { device = "/dev/disk/by-uuid/274d41e5-00f9-49f5-a325-00f0d7fb857c";
	      fsType = "ext4";
	    };

	  fileSystems."/boot" =
	    { device = "/dev/disk/by-uuid/C2A9-9775";
	      fsType = "vfat";
	      options = [ "fmask=0077" "dmask=0077" ];
	    };

	  swapDevices = [ ];

	  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
	};

};
