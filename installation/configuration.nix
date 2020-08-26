{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

# Settings {{{1

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

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;
  # support for bluetooth headsets
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  # automatically switch to newly connected devices
  hardware.pulseaudio.extraConfig = ''
    load-module module-switch-on-connect
  '';

  system.stateVersion = "20.09";

  nixpkgs.config.allowUnfree = true;

  # disables laptop beeping
  boot.extraModprobeConfig = ''
    blacklist pcspkr
  '';

  # enable members of 'wheel' group to use sudo without password
  security.sudo.extraConfig = ''
    %wheel ALL=\(ALL\) NOPASSWD: ALL
  '';

  fonts.enableDefaultFonts = true;

  users.mutableUsers = false;

  virtualisation.docker.autoPrune.enable = true;

  # fonts.fontconfig.defaultFonts.monospace
  # fonts.fontconfig.defaultFonts.sansSerif
  # fonts.fontconfig.defaultFonts.serif

  programs.xonsh.enable = true;

  boot.cleanTmpDir = true;

  # improved battery usage
  services.tlp.enable = true;

  networking.networkmanager.enable = true;

  virtualisation.docker.enable = true;

  hardware.cpu.intel.updateMicrocode = true;

# Users {{{1

  users.users.cjbassi = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      # can run docker commands without sudo
      "docker"
    ];
    shell = pkgs.xonsh;
  };

# Packages {{{1

  environment.systemPackages = with pkgs; [
    alacritty
    alsaUtils
    apulse
    aspell
    aspellDicts.en
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
    insync
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
    xwayland
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
}
