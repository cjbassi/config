# Before reinstall:
  * bookmark Chrome tabs
  * close applications
  * `code --list-extensions | xargs -L 1 echo code --install-extension > ~/config/installation/vscode-extensions.sh`
  * make sure projects in `~/playground` are synced up to GitHub
  * check home directory for files or data that needs to be backed up
  * `cp -f $XDG_DATA_HOME/zsh/history ~/Drive/linux/history`
  * push local changes in `~/config`
  * `rm -rf ~/Drive/linux/config`
  * wait for Insync to finish syncing
  * restart and wait for Insync to finish syncing
  * make sure computer is plugged in
  * plug in bootable Arch Linux thumb drive
  * restart

# After Install:
  * `nmcli dev wifi con 'Bassi Wi-Fi' password ...`
  * `rm -rf ~/.local/share/zgen; zgen reset`
  * login to Chrome, Discord, Spotify
  * Spotify settings:
    * show unavailable songs
    * don't show friend activity
    * disable autoplay
    * don't show new releases
  * Insync configuration:
    * select `Drive` folder
    * exempt folders:
      * osu!
      * school except for in-progress
    * don't sync shared files
    * ignored files:
      * `node_modules`
      * `.venv`
    * convert Google Docs
    * sync new children of partial folders
  * Chrome configuration:
    * cors off
    * only show extensions up to Wappalyzer
    * set zoom level to 125%
    * font: Dejavu
    * enable system titlebar and borders
  * Bluetooth headphones:
    * start pairing mode on headphones
    * commands:
      * `bluetoothctl`
      * `scan on`
      * `pair 04:52:C7:5C:3B:CF`
      * `connect 04:52:C7:5C:3B:CF`
      * `pactl set-card-profile bluez_card.04_52_C7_5C_3B_CF a2dp_sink`
  * `~/config/installation/after-reinstall.sh`
  * remove old GitHub token on GitHub
