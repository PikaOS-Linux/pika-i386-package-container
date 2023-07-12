# We just want ubuntu with our apt packages already included
FROM pika-i386-package-container
RUN apt update
