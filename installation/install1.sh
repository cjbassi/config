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

# rm -f /usr/include/rpcsvc/{nis.h,nis.x,nis_callback.h,nis_callback.x,nis_object.x,nis_tags.h,nislib.h,yp.h,yp.x,yp_prot.h,ypclnt.h,yppasswd.h,yppasswd.x,ypypd.h}
# rm -f /usr/lib/libnsl.so
# TODO

# Sync database, update keyring, and update mirrors with Reflector
pacman -Sy --noconfirm archlinux-keyring reflector --overwrite '*'
reflector --verbose --country 'United States' --protocol https --sort rate --save /etc/pacman.d/mirrorlist
# TODO didn't work last time

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
    jdk8-openjdk                    \
    php                             \
\
    go                              \
    dep                             \
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
    dunst                           \
    exa                             \
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
    ncdu                            \
    neovim                          \
        python-neovim               \
    openssh                         \
    parted                          \
    pydf                            \
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
    rsync                           \
    sshfs                           \
    strace                          \
    sxhkd                           \
    sxiv                            \
    tig                             \
    tk                              \
    variety                         \
    vlc                             \
    whois                           \
    xcape                           \
    xclip                           \
    xdo                             \
    xdotool                         \
    xf86-input-wacom                \
    xsel                            \
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

# tmpreaper


# Chroot {{{1

# Fstab
genfstab -U /mnt >> /mnt/etc/fstab

curl https://raw.githubusercontent.com/cjbassi/config/master/installation/install2.sh > /mnt/install2.sh
chmod +x /mnt/install2.sh
arch-chroot /mnt ./install2.sh
