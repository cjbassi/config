wifi-menu
mount -L ROOT /mnt
mount -L BOOT /mnt/boot
rm -rf /mnt
curl -L https://goo.gl/J38pUW > arch1.sh
bash arch1.sh
