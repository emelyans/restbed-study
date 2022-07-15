FROM gcc:latest

LABEL maintainer "Sergei"
LABEL image_type "Restbed dev container"

RUN apt update \
    && apt upgrade -y \
    && apt install -y cmake git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src

RUN git clone --recursive https://github.com/corvusoft/restbed.git \
    && mkdir restbed/build \
    && cd restbed/build \
    && cmake [-DBUILD_SSL=NO] [-DBUILD_TESTS=NO] .. \
    && make install

CMD /bin/bash

