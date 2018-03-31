wifi-menu
mount -L ROOT /mnt
mount -L BOOT /mnt/boot
rm -rf /mnt
curl -L https://goo.gl/J38pUW > install1.sh
cat install1.sh
bash install1.sh
