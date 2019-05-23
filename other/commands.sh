# vim: ft=sh

# Abbreviations {{{1

alias blt=bluetoothctl
alias br=batch-rename
alias c=code
alias chrome=google-chrome-stable
alias g=hub
alias l=ll
alias lst="laptop-screen toggle"
alias n=nvim
alias nw=new-wallpaper
alias pg="ping google.com -c 1"
alias t="tree"

alias scu="systemctl --user"
alias jcu="journalctl --user"
alias scudr="systemctl --user daemon-reload"
alias ssc="sudo systemctl"
alias sscdr="sudo systemctl daemon-reload"

alias m=make
alias mr="make run"

alias cra=create-react-app
function crat { create-react-app "$@" --typescript; }

alias cb="cargo build"
alias cf="cargo fmt"
alias ci="cargo install --path . --force"
alias cr="cargo run --"
alias ct="cargo test"

alias gr="go run *.go"

alias codediff="code -n -d"
alias nvimdiff="nvim -d"
alias se=sudoedit
alias nvp=nvimpager

alias gpgkey="gpg --full-gen-key"
alias sshkey="ssh-keygen -t ed25519 -C \"$(whoami)@$(hostname)-$(date -I)\""


# New Commands {{{1

alias clean-tmp="tmpreaper 14d /tmp/"
alias clean-trash="trash empty 30 --no-confirm"

function fork {
    nohup "$@" </dev/null >/dev/null 2>&1 & disown
}

function fork-term {
    fork $TERMINAL --working-directory .
}

alias keep-a-changelog="curl https://gist.githubusercontent.com/cjbassi/c46d47273bd3929c3f47b4c5c14311dc/raw/6723ef21f4ddcbd4d348310fcc0914e1dae1cb3a/CHANGELOG.md > CHANGELOG.md"

function mkcd {
    mkdir "$@"; cd "$@"
}

function new-wallpaper {
    folder_path=$HOME/Drive/images/desktop_wallpapers/other
    image_path=$(fd . --full-path --type f $folder_path | shuf -n 1)
    swaymsg output "*" bg "$image_path" fill
    # swaybg --image "$image_path" --mode fill
    echo \"$image_path\" > ~/.wallpaper
}

function pkill-wait {
    while pgrep -u $UID -x $1 >/dev/null; do sleep 1; done
}

function prepend {
    cat - "$@" | sponge "$@"
}

function reload-process {
    killall -q "$@"
    pkill-wait "$@"
    fork "$@"
}

function remove-go-package {
    go clean -i "$@"...
}

function setup-new-project {
    license-gen mit > LICENSE
    keep-a-changelog
    hub init
    hub add .
    hub commit -m "Initial commit"
    hub create "$@"
    hub push -u origin master
}

alias show-pacman-history="grep -i installed /var/log/pacman.log"

function upgrade-all {
    upgrade-yay
    antigen update
    rustup update
    cargo install-update -a
    # go get -u all
    nvim +PlugUpgrade +PlugUpdate +xall
    yarn global upgrade
    npm update -g
    upgrade-pip --user
}

function upgrade-pip {
    if [[ $1 == "--user" ]]; then
        pip list --outdated --format=freeze --user | grep -v "^\-e" | cut -d = -f 1 | xargs -n1 pip install -U --user
    else
        pip list --outdated --format=freeze | grep -v "^\-e" | cut -d = -f 1 | xargs -n1 pip install -U
    fi
}

function upgrade-system {
    yay -Syu --noconfirm --needed --devel --mflags "--nocheck"
}


# Runtime configuration {{{1

function laptop-screen {
    swaymsg output eDP-1 "$@"
}

function reload-settings {
    if swaymsg -t get_outputs | grep -q "HDMI-A-1" ; then
        laptop-screen disable
    else
        laptop-screen enable
    fi

    systemctl --user restart mako
    systemctl --user restart waybar
    systemctl --user restart evscript
}

function startup {
    systemctl --user import-environment
    systemctl --user start sway-session.target

    new-wallpaper

    pamixer --set-volume 30
    pamixer --default-source --set-volume 100

    # TODO
    # alacritty -e pymath &
}


# Settings {{{1

alias bat="bat -p"
alias batch-rename="batch-rename -v"
alias dmesg="dmesg -T"
alias fd="fd -H --ignore-file ~/.ignore"
alias ffmpeg='ffmpeg -loglevel warning'
alias google-chrome-stable="google-chrome-stable --remote-debugging-port=9222 --new-window --force-device-scale-factor=1.0"
alias ll="exa -aFl --group-directories-first --git"
alias makepkg="makepkg -si"
alias ncdu="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias ps="ps aux"
alias rg="rg -S"
alias rsync="rsync -h --progress"
alias sshfs="sshfs -C -o reconnect"
alias su="sudo -E su -m"
alias sudo="sudo "  # expands aliases for sudo commands
alias uname="uname -a"
alias w="w -f"

alias cp="cp -iv"
alias ln="ln -v"
alias mkdir="mkdir -vp"
alias mv="mv -iv"

alias df="df -h"
alias du="du -h"

alias g++="g++ -g -Wall"
alias gcc="gcc -g -Wall"

alias tree="exa -T"
alias valgrind="colour-valgrind --leak-check=yes --track-origins=yes"
alias df=pydf
alias git=hub
alias ls=exa

function yay {
    if [[ "$1" == "-S" ]]; then
        command yay "$@" --needed --mflags "--nocheck"
    elif [[ "$1" == "-R" ]]; then
        command yay "$@" --recursive
    else
        command yay "$@"
    fi
}

# alias ll='exa -AhgoF --group-directories-first --color=always'
# TODO rsync progress1 and 2
# alias rsync='rsync -h --info=all2'
