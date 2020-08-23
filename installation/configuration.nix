{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.wireless.enable = true;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.docker0.useDHCP = true;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp4s0.useDHCP = true;

  console.font = "Hack";

  time.timeZone = "America/Los_Angeles";

  environment.systemPackages = with pkgs; [
	  hack-font
  ];

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.cjbassi = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  system.stateVersion = "20.09";
}
