# We just want ubuntu with our apt packages already included
FROM pika-i386-package-container
RUN dpkg --add-architecture amd64
RUN echo 'deb [trusted=yes] https://deb.nodesource.com/node_16.x lunar main' > /etc/apt/sources.list.d/node.list
RUN apt update
RUN apt install nodejs:amd64
RUN mkdir -p /__e/node16/bin/
RUN ln -sfv /usr/bin/node /__e/node16/bin/
