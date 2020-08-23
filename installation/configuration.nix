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
	  alacritty
	  alsaUtils
	  apulse
	  astyle
	  bat
	  blueman
	  breeze-gtk
	  calibre
	  cargo-edit
	  cargo-update
	  ccache
	  cht-sh
	  clang
	  cmake
	  copyq
	  docker
	  docker-compose
	  dua
	  earlyoom
	  element-desktop
	  emacs
	  exa
	  fd
	  fuse
	  fzf
	  gdb
	  gimp
	  git
	  gnupg
	  google-chrome
	  grim
	  hack-font
	  httpie
	  imgurbash2
	  inotify-tools
	  iotop
	  jq
	  kdeconnect
	  krita
	  libreoffice
	  libsecret
	  light
	  loop
	  lsof
	  mako
	  moreutils
	  mypy
	  ncdu
	  neofetch
	  networkmanager
	  networkmanager_dmenu
	  networkmanagerapplet
	  nodejs
	  openssh
	  p7zip
	  pamixer
	  pandoc
	  parted
	  pasystray
	  pavucontrol
	  playerctl
	  portaudio
	  postgresql
	  pulseaudio
	  pydf
	  python
	  qbittorrent
	  redshift-wlr
	  ripgrep
	  rofi
	  rsync
	  sccache
	  skim
	  slurp
	  spotify
	  sshfs
	  strace
	  sway
	  swaybg
	  swayidle
	  swaylock
	  time
	  tk
	  tokei
	  udiskie
	  unzip
	  valgrind
	  variety
	  vlc
	  waybar
	  wget
	  whois
	  xclip
	  xonsh
	  xsel
	  yarn
	  youtube-dl
	  ytop
	  zip

	  gitAndTools.delta
	  gitAndTools.diff-so-fancy
	  gitAndTools.git-extras
	  gitAndTools.hub

	  perlPackages.FileMimeInfo

	  python38Packages.grip

	  xorg.xeyes
  ];

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.cjbassi = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  system.stateVersion = "20.09";

  nixpkgs.config.allowUnfree = true;
}
