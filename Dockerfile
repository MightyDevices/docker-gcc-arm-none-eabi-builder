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

# sadly enough I wasn't able to run the arm-none-eabi-gdb from the developer.arm.com due to some screwup with libtinfo.so.5 
# BUT there is a way around it - you can use the arm-none-eabi-gdb from the alpine repository!

# add the 'test' repository - this is where the arm-none-eabi-gdb resides at the time of this writing
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
# install the gdb
RUN apk add --no-cache gdb-arm-none-eabi@testing
# rename the not working gdb so that it doesn't get confused with the proper one from /usr/bin/
RUN mv /gcc-arm-none-eabi-8-2019-q3-update/bin/arm-none-eabi-gdb /gcc-arm-none-eabi-8-2019-q3-update/bin/arm-none-eabi-gdb_
