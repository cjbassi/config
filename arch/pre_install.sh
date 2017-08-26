# Before reboot:
    # Check home directory for loose files or info to grab
    # commit config
    # delete config from Dropbox

wifi-menu
mount -L ROOT /mnt
mount -L BOOT /mnt/boot
rm -rf /mnt
curl -L https://goo.gl/fnq2ve > arch1.sh
bash arch1.sh
