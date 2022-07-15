FROM gcc:latest as restbed-builder
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


FROM gcc:latest
LABEL maintainer "Sergei"
LABEL image_type "Restbed dev container"
RUN apt update \
    && apt upgrade -y \
    && apt install -y cmake git vim \
    && rm -rf /var/lib/apt/lists/*
COPY --from=restbed-builder /usr/src/restbed/distribution/include /usr/include
COPY --from=restbed-builder usr/src/restbed/distribution/library /usr/lib/restbed
COPY src/examples /usr/src/examples
WORKDIR /usr/src/examples
CMD /bin/bash

