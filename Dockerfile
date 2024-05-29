FROM ubuntu:22.04
MAINTAINER sminot@fredhutch.org

ENV DEBIAN_FRONTEND noninteractive
RUN apt update && \
	apt install -y software-properties-common && \
	add-apt-repository ppa:deadsnakes/ppa && \
	apt update && \
	apt install -y build-essential hdf5-tools libhdf5-dev libhdf5-serial-dev && \
	apt install -y zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev wget libbz2-dev liblzma-dev && \
	apt install -y python3.12 && \
	apt install -y python3-pip tcl

# Install redis
RUN mkdir /usr/local/redis && \
	cd /usr/local/redis && \
	wget http://download.redis.io/redis-stable.tar.gz && \
	tar xvzf redis-stable.tar.gz && \
	cd redis-stable  && \
	make  && \
	make install
