# We just want ubuntu with our apt packages already included
FROM pika-i386-package-container
RUN dpkg --add-architecture amd64
RUN apt update
RUN apt curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -
RUN apt install nodejs:amd64
RUN mkdir -p /__e/node16/bin/
RUN ln -sfv /usr/bin/node /__e/node16/bin/
