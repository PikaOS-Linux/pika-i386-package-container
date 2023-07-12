#! /bin/bash
DEBIAN_FRONTEND=noninteractive apt-get -y update
DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common sudo git bc gpg gpg-agent wget -y
wget https://ppa.pika-os.com/dists/lunar/pika-sources.deb
DEBIAN_FRONTEND=noninteractive apt-get install ./pika-sources.deb --yes --option Acquire::Retries=5 --option Acquire::http::Timeout=100 --option Dpkg::Options::="--force-confnew"
rm -rf ./pika-sources.deb
DEBIAN_FRONTEND=noninteractive apt-get -y update
DEBIAN_FRONTEND=noninteractive apt-get -y upgrade --allow-downgrades
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata

