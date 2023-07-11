#! /bin/bash
DIST=lunar ARCH=i386 debootstrap --arch=i386 lunar base_chroot || true
rm -rf base_chroot/debootstrap
rm -rf base_chroot/var
mkdir base_chroot/var
sudo tar -C ./base_chroot -c ./base_chroot.tgz


