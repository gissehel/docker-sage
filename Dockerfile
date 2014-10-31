# Build sage-6.3 from source, and put it in a container
from ubuntu
# Based on github:swenson/docker-sage
maintainer Gissehel <public-docker-sagemath@gissehel.org>

# base ubuntu stuff
run echo "deb http://archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list && \
 apt-get update && \
 apt-get upgrade -y && \
 apt-get install -y build-essential ca-certificates m4 curl && \
 curl -Lso /tmp/sage-6.3.tar.gz http://boxen.math.washington.edu/home/sagemath/sage-mirror/src/sage-6.3.tar.gz && \
 tar xvzf /tmp/sage-6.3.tar.gz && \
 cd sage-6.3 && make && \
 sage-6.3/sage -c 'quit()'
entrypoint sage-6.3/sage

