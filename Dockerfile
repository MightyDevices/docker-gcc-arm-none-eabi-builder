# glibc is needed for the gcc toolchain to run
FROM frolvlad/alpine-glibc

# install make
RUN apk add --no-cache make

# get the toolchain
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2019q3/RC1.1/gcc-arm-none-eabi-8-2019-q3-update-linux.tar.bz2

# unpack & remove the archive
RUN tar xjfv gcc-arm-none-eabi-8-2019-q3-update-linux.tar.bz2
RUN rm gcc-arm-none-eabi-8-2019-q3-update-linux.tar.bz2

# add the tools to the path
ENV PATH="/gcc-arm-none-eabi-8-2019-q3-update/bin:${PATH}"
