{ config, pkgs, ... }:

let

  my-config-dir = "/home/cjbassi/config";

  home-manager-repo = builtins.fetchTarball "https://github.com/rycee/home-manager/archive/master.tar.gz";
  nur-repo = builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz";
  spacemacs-repo = builtins.fetchTarball "https://github.com/syl20bnr/spacemacs/archive/develop.tar.gz";

in

{
  imports =
    [
      ./hardware-configuration.nix
      (import "${home-manager-repo}/nixos")
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
    nur = import nur-repo {
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
    # prevents installing uneeded packages
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

# Services {{{1

  systemd.services.lockscreen-on-suspend = {
    wantedBy = [ "sleep.target" ];
    before = [ "sleep.target" ];
    script = ''
      export XDG_RUNTIME_DIR=/run/user/$(id -u $USER)
      export SWAYSOCK=/run/user/$(id -u $USER)/sway-ipc.$(id -u $USER).$(pgrep -x sway).sock
      swaylock
    '';
    serviceConfig = {
      Type = "forking";
      User = "cjbassi";
    };
  };

  # https://github.com/gustavo-iniguez-goya/opensnitch/blob/main/daemon/opensnitchd.service
  # systemd.services.opensnitchd = {
  #   wantedBy = [ "multi-user.target" ];
  #   wants = [ "network.target" ];
  #   after = [ "network.target" ];
  #   serviceConfig.ExecStart = "${pkgs.nur.repos.onny.opensnitchd}/bin/opensnitchd";
  # };

  systemd.services.reload-settings-on-wake = {
    wantedBy = [ "sleep.target" ];
    after = [ "sleep.target" ];
    script = ''
      export XDG_RUNTIME_DIR=/run/user/$(id -u $USER)
      export SWAYSOCK=/run/user/$(id -u $USER)/sway-ipc.$(id -u $USER).$(pgrep -x sway).sock
      reload-settings
    '';
    serviceConfig.User = "cjbassi";
  };

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
    cargo-bloat
    cargo-edit
    cargo-outdated
    cargo-udeps
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
    rust-analyzer
    sccache
    skim
    slurp
    spotify
    strace
    sway
    swaybg
    swayidle
    swaylock-effects
    time
    tk
    tokei
    udiskie
    udisks
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
    nur.repos.onny.opensnitch-ui
  ];

# home-manager {{{1

  home-manager.users.cjbassi = {

    xsession.preferStatusNotifierItems = true;

    xdg.configFile."emacs".source = spacemacs-repo;

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

    systemd.user.targets.sway-session = {
      Unit = {
        BindsTo = [ "graphical-session.target" ];
        Wants = [ "graphical-session-pre.target" ];
        After = [ "graphical-session-pre.target" ];
      };
    };

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

    services.udiskie = {
      enable = true;
      tray = "always";
    };

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

    # systemd.user.services.evscript = {
    #   Unit.PartOf = [ "graphical-session.target" ];
    #   Service = {
    #     ExecStart = "${pkgs.fd}/bin/fd '^.*kbd$' /dev/input/by-path | xargs sudo ${pkgs.nur.repos.cjbassi.evscript}/bin/evscript -f ~/config/evscript.dyon -d";
    #     SerExecStop="sudo pkill evscript";
    #   };
    #   Install.WantedBy = [ "graphical-session.target" ];
    # };

    systemd.user.services.insync = {
      Unit = {
        After = [
          "local-fs.target"
          "network.target"
        ];
        PartOf = [ "graphical-session.target" ];
      };
      Service = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = "${pkgs.insync}/bin/insync start --synchronous-full";
        ExecStop = "${pkgs.insync}/bin/insync quit";
      };
      Install.WantedBy = [ "graphical-session.target" ];
    };

    systemd.user.services.opensnitch-ui = {
      Unit.PartOf = [ "graphical-session.target" ];
      Service.ExecStart = "${pkgs.nur.repos.onny.opensnitch-ui}/bin/opensnitch-ui --config ~/.config/opensnitch/ui-config.json";
      Install.WantedBy = [ "graphical-session.target" ];
    };

    systemd.user.services.swayidle = {
      Unit.PartOf = [ "graphical-session.target" ];
      Service.ExecStart = ''
        {pkgs.swayidle}/bin/swayidle -w \
          timeout 300 'swaylock' \
          timeout 600 'swaymsg "output * dpms off"' \
          resume 'swaymsg "output * dpms on"'
      '';
      Install.WantedBy = [ "graphical-session.target" ];
    };

    systemd.user.services.variety = {
      Unit.PartOf = [ "graphical-session.target" ];
      Service.ExecStart = "${pkgs.variety}/bin/variety";
      Install.WantedBy = [ "graphical-session.target" ];
    };
  };
}
