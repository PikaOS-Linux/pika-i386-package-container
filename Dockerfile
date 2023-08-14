# We just want ubuntu with our apt packages already included
# Bump for rebuild on 14/08/2023 15:51 UTC +3
FROM pika-i386-package-container
RUN dpkg --add-architecture amd64
RUN apt update
RUN apt-get -y install sudo git bc gpg gpg-agent bison build-essential ccache cpio fakeroot flex git kmod libelf-dev libncurses5-dev libssl-dev lz4 qtbase5-dev rsync schedtool wget zstd tar reprepro dpkg-sig devscripts dh-make rpm2cpio -y
RUN apt curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -
RUN apt install nodejs:amd64 -y
RUN mkdir -p /__e/node16/bin/
RUN ln -sfv /usr/bin/node /__e/node16/bin/
