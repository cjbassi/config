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
alias tp="trash put -v"

alias scu="systemctl --user"
alias jcu="journalctl --user"
alias scudr="systemctl --user daemon-reload"
alias ssc="sudo systemctl"
alias sscdr="sudo systemctl daemon-reload"

alias m=make
alias mr="make run"

alias cra=create-react-app
function crat
    create-react-app $argv --typescript
end

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
alias sshkey="ssh-keygen -t ed25519 -C \"(whoami)@(hostname)-(date -I)\""

alias clean-tmp="tmpreaper 14d /tmp/"
alias clean-trash="trash empty 30 --no-confirm"


# New Commands {{{1

function fork
    nohup $argv </dev/null >/dev/null 2>&1 & disown
end

function fork-term
    fork $TERMINAL --working-directory .
end

function mkcd
    mkdir -p $argv
    cd $argv
end

# TODO $UID
function pkill-wait
    while pgrep -u $UID -x $argv[1] >/dev/null
        sleep 1
    end
end

function prepend
    cat - $argv | sponge $argv
end

function reload-process
    killall -q $argv
    pkill-wait $argv
    fork $argv
end

function remove-go-package
    go clean -i $argv...
end

function setup-new-project
    license-gen mit > LICENSE
    keep-a-changelog
    hub init
    hub add .
    hub commit -m "Initial commit"
    hub create $argv
    hub push -u origin master
end

alias show-pacman-history="grep -i installed /var/log/pacman.log"

function upgrade-all
    upgrade-yay
    # TODO: antigen update
    rustup update
    cargo install-update -a
    # go get -u all
    nvim +PlugUpgrade +PlugUpdate +xall
    yarn global upgrade
    npm update -g
    upgrade-pip --user
end

function upgrade-pip
    if $argv[1] == "--user"
        pip list --outdated --format=freeze --user | grep -v "^\-e" | cut -d = -f 1 | xargs -n1 pip install -U --user
    else
        pip list --outdated --format=freeze | grep -v "^\-e" | cut -d = -f 1 | xargs -n1 pip install -U
    end
end

function upgrade-system
    yay -Syu --noconfirm --needed --devel --mflags "--nocheck"
end


# Runtime configuration {{{1

function laptop-screen
    swaymsg output eDP-1 $argv
end

function new-wallpaper
    set folder_path $HOME/Drive/images/desktop_wallpapers/other
    set image_path (fd . --full-path --type f $folder_path | shuf -n 1)
    swaymsg output "*" bg "$image_path" fill
    # swaybg --image "$image_path" --mode fill
    echo \"$image_path\" > ~/.wallpaper
end

function reload-settings
    if swaymsg -t get_outputs | grep -q "HDMI-A-1"
        laptop-screen disable
    else
        laptop-screen enable
    end

    systemctl --user restart mako
    systemctl --user restart waybar
    systemctl --user restart evscript
end

function startup
    systemctl --user import-environment
    systemctl --user start sway-session.target

    new-wallpaper

    pamixer --set-volume 30
    pamixer --default-source --set-volume 100

    # TODO
    # alacritty -e pymath &
end


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
alias rg="rg -S --hidden"
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

alias pager=$PAGER
alias zless=$PAGER
alias less=$PAGER

alias ls="ls --color=always"
alias dir="dir --color=always"
alias vdir="vdir --color=always"
alias grep="grep --color=always"
alias fgrep="fgrep --color=always"
alias egrep="egrep --color=always"
alias pcregrep="pcregrep --color=always"
alias watch="watch --color"
alias diff="diff --color=always"
alias ip="ip -c"
alias dmesg="dmesg --color=always"
alias fdisk="fdisk --color=always"
alias cower="cower --color=always"
alias pactree="pactree -c"

function yay
    switch $argv[1]
        case "-S"
            command yay $argv --needed --mflags "--nocheck"
        case "-R"
            command yay $argv --recursive
        case '*'
            command yay $argv
    end
end

# alias ll='exa -AhgoF --group-directories-first --color=always'
# TODO rsync progress1 and 2
# alias rsync='rsync -h --info=all2'
