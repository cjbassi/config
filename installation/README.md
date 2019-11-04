### Info

Category    | Implementation
------------|----------------------------------------------
boot loader | systemd-boot
encryption  | LUKS on a partition unlocked with a keyphrase

### Files

File                   | Description
-----------------------|------------------------------------------------------------------------
`manual.md`            | manual instructions to perform either before reinstalling or after reinstalling
`pre-install.sh`       | manual commands that initiate the installation process from the live image
`install1.sh`          | installation script to run from the live image
`install2.sh`          | installation script to run as root after `chroot`ing
`install3.sh`          | installation script to run as non-root user
`post-install.sh`      | script to run after booting into the new installation
`vscode-extensions.sh` | script that installs all vscode extensions
