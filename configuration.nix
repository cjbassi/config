{ config, pkgs, ... }:

let

  my-config-dir = "/home/cjbassi/config";

in

{
  imports =
    [
      ./hardware-configuration.nix
      (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos")
    ];

# Settings {{{1

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  time.timeZone = "America/Los_Angeles";

  system.stateVersion = "20.09";

  nixpkgs.config.allowUnfree = true;

  # disables laptop beeping
  boot.extraModprobeConfig = ''
    blacklist pcspkr
  '';

  security.sudo.wheelNeedsPassword = false;

  users.mutableUsers = false;

  boot.cleanTmpDir = true;

  hardware.cpu.intel.updateMicrocode = true;

  nix.gc.automatic = true;

  system.autoUpgrade.enable = true;

  # https://github.com/nix-community/NUR
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  # improved battery usage
  services.tlp.enable = true;

  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

# Programs {{{2

  programs.xonsh.enable = true;

  programs.sway = {
    enable = true;
    extraPackages = [];
  };

# Fonts {{{2

  console.font = "Hack";

  fonts.enableDefaultFonts = true;

# Networking {{{2

  networking.wireless.enable = true;

  networking.networkmanager.enable = true;

# Sound and bluetooth {{{2

  sound.enable = true;

  hardware.bluetooth.enable = true;

  hardware.pulseaudio = {
    enable = true;
    # support for bluetooth headsets
    package = pkgs.pulseaudioFull;
    # automatically switch to newly connected devices
    extraConfig = ''
      load-module module-switch-on-connect
    '';
  };

  services.blueman.enable = true;

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
    cargo
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
    gparted
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
    nixfmt
    nodejs
    openssh
    p7zip
    pamixer
    pandoc
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
    virtualbox
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

    nur.repos.crazazy.js.CRA
    # nur.repos.onny.opensnitchd
    # nur.repos.onny.opensnitch-ui
  ];

# home-manager {{{1

  home-manager.users.cjbassi = {

    home.file.".emacs.d".source = pkgs.fetchFromGitHub {
      owner = "syl20bnr";
      repo = "spacemacs";
      rev = "39df5e2";
      sha256 = "12anvs9yc6jk0gm1qcs8wz5fmxdjndszq68603cfksav6p9fsv1d";
    };

# Files and folders {{{2

    # xdg.configFile = {
    #   source = "${my-config-dir}/.config";
    #   recursive = true;
    # };

    # xdg.dataFile = {
    #   source = "${my-config-dir}/.local/share";
    #   recursive = true;
    # };

    # home.file = {
    #   source = "${my-config-dir}/dotfiles";
    #   recursive = true;
    # };

    # home.file."Trash".source = "/home/cjbassi/.local/share/Trash/files";
    # home.file."Trash".source = "${config.users.users.cjbassi}/.local/share/Trash/files";

# Services {{{2

    programs.mako.enable = true;

    programs.waybar = {
      enable = true;
      systemd.enable = true;
    };

    services.blueman-applet.enable = true;

    services.kdeconnect = {
      enable = true;
      indicator = true;
    };
    services.network-manager-applet.enable = true;

    services.pasystray.enable = true;

    services.redshift = {
      enable = true;
      package = pkgs.redshift-wlr;
      provider = "geoclue2";
    };
    services.udiskie.enable = true;

    systemd.user.services.copyq = {
      Unit.PartOf = [ "graphical-session.target" ];
      Service.ExecStart = "${pkgs.copyq}/bin/copyq";
      Install.WantedBy = [ "graphical-session.target" ];
    };

    systemd.user.services.element-desktop = {
      Unit.PartOf = [ "graphical-session.target" ];
      Service.ExecStart = "${pkgs.element-desktop}/bin/element-desktop";
      Install.WantedBy = [ "graphical-session.target" ];
    };

    # systemd.user.services.opensnitch-ui = {
    #   Unit.PartOf = [ "graphical-session.target" ];
    #   Service.ExecStart = "${pkgs.nur.repos.onny.opensnitch-ui}/bin/ExecStart=opensnitch-ui --config ~/.config/opensnitch/ui-config.json";
    #   Install.WantedBy = [ "graphical-session.target" ];
    # };
  };
}
