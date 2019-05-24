### Info

Category    | Implementation
------------|----------------------------------------------
boot loader | systemd-boot
encryption  | LUKS on a partition unlocked with a keyphrase

### Files

File                   | Description
-----------------------|------------------------------------------------------------------------
`manual.md`            | manual instructions to perform before reinstalling and after installing
`pre-install.sh`       | manual commands that initiate the installation process
`install1.sh`          | installation commands run in the live image
`install2.sh`          | installation commands run as root after `chroot`ing
`install3.sh`          | installation commands run as non-root user
`post-install.sh`      | some commands to run after booting into the new installation
`vscode-extensions.sh` | script that installs all vscode extensions
