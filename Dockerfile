# this points to the lts version
FROM ubuntu:latest

# wget is needed to get the toolchain, make is needed for builing your 
# projects
RUN apt-get update && apt-get install -y wget make python3 xz-utils

# add cpio
RUN apt-get install cpio libncurses6 -y

# get the toolchain
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi.tar.xz -O gcc-arm-none-eabi.tar.xz

# unpack the archive to a neatly named target directory
RUN mkdir gcc-arm-none-eabi && unxz gcc-arm-none-eabi.tar.xz
# extract tar file
RUN tar xf gcc-arm-none-eabi.tar -C gcc-arm-none-eabi --strip-components 1
# remove the archive
RUN rm gcc-arm-none-eabi.tar

# create symbolic links for libs needed by gdb
RUN ln -s /lib/x86_64-linux-gnu/libncurses.so.6 /lib/x86_64-linux-gnu/libncursesw.so.5
RUN ln -s /lib/x86_64-linux-gnu/libtinfo.so.6 /lib/x86_64-linux-gnu/libtinfo.so.5

# add the tools to the path
ENV PATH="/gcc-arm-none-eabi/bin:${PATH}"


