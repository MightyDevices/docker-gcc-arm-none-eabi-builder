# this points to the lts version
FROM ubuntu:18.04

# wget is needed to get the toolchain, make is needed for builing your 
# projects
RUN apt-get update && apt-get install -y wget make

# get the toolchain
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2 -O gcc-arm-none-eabi.tar.bz2

# unpack the archive to a neatly named target directory
RUN mkdir gcc-arm-none-eabi && tar xjfv gcc-arm-none-eabi.tar.bz2 -C gcc-arm-none-eabi --strip-components 1
# remove the archive
RUN rm gcc-arm-none-eabi.tar.bz2

# add the tools to the path
ENV PATH="/gcc-arm-none-eabi/bin:${PATH}"
