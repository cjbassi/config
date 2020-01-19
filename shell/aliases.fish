# Abbreviations {{{1

alias blt=bluetoothctl
alias br=batch-rename
alias c=code
alias chrome=google-chrome-stable
alias g=git
alias l=ll
alias lst="laptop-screen toggle"
alias n=nvim
alias nvp=nvimpager
alias nw=new-wallpaper
alias se=sudoedit
alias t=tree
alias tp="trash put"

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


# New commands {{{1

alias fork-term="fork alacritty --working-directory ."
alias laptop-screen="swaymsg output $INTERNAL_DISPLAY"
alias pg="ping google.com -c 1"
alias show-install-history="grep -i installed /var/log/pacman.log"
alias srcinfo="makepkg --printsrcinfo > .SRCINFO"

alias codediff="code -n -d"
alias nvimdiff="nvim -d"

alias gpgkey="gpg --full-gen-key"
alias sshkey="ssh-keygen -t ed25519 -C \"(whoami)@(hostname)-(date -I)\""

alias clean-tmp="tmpreaper 14d /tmp/"
alias clean-trash="trash empty 30 --no-confirm"

function mkcd
	mkdir -p $argv
	cd $argv
end


# Settings {{{1

# Colors {{{2

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
alias ncdu="ncdu --color dark"

# Verbose {{{2

alias cp="cp -v"
alias batch-rename="batch-rename -v"
alias ln="ln -v"
alias mkdir="mkdir -v"
alias mv="mv -v"
alias rm="rm -v"

function trash
	if count $argv > 0 && test $argv[1] = "put"
		command trash put -v $argv[2..-1]
	else
		command trash $argv
	end
end

# Human readable {{{2

alias df="df -h"
alias du="du -h"
alias rsync="rsync -h"

# Hidden files {{{2

alias dmesg="dmesg -T"
alias exa="exa -a"
alias fd="fd -H"
alias rg="rg --hidden"

# Other {{{2

alias g++="g++ -g -Wall"
alias gcc="gcc -g -Wall"

alias cp="cp -i"
alias mv="mv -i"

alias su="sudo -E su -m"
alias sudo="sudo "  # expands aliases for sudo commands

alias bat="bat -p"
alias colour-valgrind="colour-valgrind --leak-check=yes --track-origins=yes"
alias fd="fd --ignore-file ~/.ignore"
alias ffmpeg="ffmpeg -loglevel warning"
alias google-chrome-stable="google-chrome-stable --remote-debugging-port=9222 --new-window --force-device-scale-factor=1.0"
alias ll="exa -Fl --group-directories-first --git --icons"
alias makepkg="makepkg -si"
alias mkdir="mkdir -p"
alias rg="rg -S"
alias rsync="rsync --progress"
alias sshfs="sshfs -C -o reconnect"
alias time="time -p"
alias tty-clock="tty-clock -c"
alias unimatrix="unimatrix -s 94"

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


# Alternatives {{{1

alias less=$PAGER
alias pager=$PAGER
alias zless=$PAGER

alias df=pydf
alias git=hub
alias ls=exa
alias tree="exa --tree --ignore-glob .git"
alias valgrind=colour-valgrind


# TODO {{{1

# alias ll='exa -AhgoF --group-directories-first --color=always'
# TODO rsync progress1 and 2
# alias rsync='rsync -h --info=all2'
