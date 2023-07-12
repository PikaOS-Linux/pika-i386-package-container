#! /bin/bash
set -e
DIST=lunar ARCH=i386 debootstrap --arch=i386 lunar base_chroot || true
rm -rf base_chroot/debootstrap
echo 'deb [trusted=yes] https://ppa.pika-os.com/ lunar main' > base_chroot/etc/apt/sources.list.d/pika-apt.list
chroot ./base_chroot /bin/bash -c "DEBIAN_FRONTEND=noninteractive apt-get -y update"
chroot ./base_chroot /bin/bash -c "DEBIAN_FRONTEND=noninteractive apt --fix-broken install -y"
chroot ./base_chroot /bin/bash -c "DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common sudo git bc gpg gpg-agent wget -y"
chroot ./base_chroot /bin/bash -c "wget https://ppa.pika-os.com/dists/lunar/pika-sources.deb"
chroot ./base_chroot /bin/bash -c "DEBIAN_FRONTEND=noninteractive apt-get install ./pika-sources.deb --yes --option Acquire::Retries=5 --option Acquire::http::Timeout=100 --option Dpkg::Options::="--force-confnew""
rm -rf base_chroot/etc/apt/sources.list.d/pika-apt.list
chroot ./base_chroot /bin/bash -c "rm -rf ./pika-sources.deb"
chroot ./base_chroot /bin/bash -c "DEBIAN_FRONTEND=noninteractive apt-get -y update"
chroot ./base_chroot /bin/bash -c "DEBIAN_FRONTEND=noninteractive apt-get -y upgrade --allow-downgrades"
chroot ./base_chroot /bin/bash -c "ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime"
chroot ./base_chroot /bin/bash -c "DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata"
chroot ./base_chroot /bin/bash -c "apt-get clean"
sudo tar -czvf ./base_chroot.tgz ./base_chroot


