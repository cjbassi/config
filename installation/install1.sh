#!/usr/bin/env bash

# Pre-installation {{{1

# Update the system clock
timedatectl set-ntp true

# Partition the disks
    # boot partition
        # Create a 512 MiB FAT32 partition in parted
        # Set the boot flag (not legacy_boot)
    # root partition
        # Format to ext4

# Format the partitions
#mkfs.ext4 /dev/sda1

# Mount the file systems
#mount /dev/sda1 /mnt
#mkdir /mnt/boot
#mount /dev/sda2 /mnt/boot

# Packages {{{1

# Sync database, update keyring, and update mirrors with Reflector
pacman -Sy --noconfirm archlinux-keyring reflector
reflector --verbose --country 'United States' --protocol https --sort rate --save /etc/pacman.d/mirrorlist


# Install packages
pacstrap /mnt                       \
    base                            \
    base-devel                      \
\
    xorg                            \
    xorg-xinit                      \
\
    pulseaudio                      \
    pulseaudio-alsa                 \
    pavucontrol                     \
    pamixer                         \
    alsa-utils                      \
\
    blueman                         \
    pulseaudio-bluetooth            \
    bluez                           \
    bluez-libs                      \
    bluez-utils                     \
\
    tlp                             \
    x86_energy_perf_policy          \
    acpi_call                       \
    tp_smapi                        \
\
\
    mono                            \
    go                              \
    jdk8-openjdk                    \
    php                             \
\
    gdb                             \
    valgrind                        \
    clang                           \
\
    nodejs                          \
    yarn                            \
    npm                             \
    eslint                          \
\
    python                          \
    python-pip                      \
    python-jedi                     \
    python-pylint                   \
    autopep8                        \
    flake8                          \
\
    rustup                          \
    cargo                           \
    rust-racer                      \
\
    astyle                          \
    cmake                           \
    tidy                            \
\
\
    ttf-dejavu                      \
    ttf-hack                        \
    noto-fonts-emoji                \
    awesome-terminal-fonts          \
    ttf-freefont                    \
    ttf-arphic-uming                \
    ttf-indic-otf                   \
    adobe-source-han-sans-otc-fonts \
\
    networkmanager                  \
    network-manager-applet          \
\
    unzip                           \
    zip                             \
\
    gnome-keyring                   \
    libsecret                       \
\
    breeze-gtk                      \
    calibre                         \
    ccache                          \
    docker                          \
    fd                              \
    feh                             \
    fuse                            \
    fzf                             \
    gimp                            \
    git                             \
    gnupg                           \
    httpie                          \
    hub                             \
    i3-gaps                         \
        perl-anyevent-i3            \
    inotify-tools                   \
    krita                           \
    libreoffice                     \
    lsof                            \
    maim                            \
    moreutils                       \
    neovim                          \
        python-neovim               \
    openssh                         \
    parted                          \
    qbittorrent                     \
    qt4                             \
    ranger                          \
        w3m                         \
    redshift                        \
        python-gobject              \
        python-xdg                  \
        librsvg                     \
    reflector                       \
    ripgrep                         \
    rofi                            \
    rsync                           \
    sshfs                           \
    strace                          \
    sxhkd                           \
    sxiv                            \
    tig                             \
    tk                              \
    tmpreaper                       \
    variety                         \
    vlc                             \
    whois                           \
    xcape                           \
    xclip                           \
    xdo                             \
    xdotool                         \
    xf86-input-wacom                \
    xterm                           \
    zathura-pdf-mupdf               \
    zsh                             \


# otf-ipafont
# ttf-hanazono
# ttf-symbola
# ttf-emojione-color
# ttf-twemoji-color
# adobe-source-han-sans-jp-fonts
# ttf-sazanami


# Chroot {{{1

# Fstab
genfstab -U /mnt >> /mnt/etc/fstab

curl https://raw.githubusercontent.com/cjbassi/config/master/installation/install2.sh > /mnt/install2.sh
chmod +x /mnt/install2.sh
arch-chroot /mnt ./install2.sh
