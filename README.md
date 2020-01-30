# docker-gcc-arm-none-eabi-builder
Dockerfile for Ubuntu based machine for building bare-metal Cortex-Mx applications with GCC

## How to use this in the build process
0. Open a terminal (console).
1. Build the image from the Dockerfile provided: `docker build -t gcc-arm-none-eabi .`
2. Start this image in the background (detached mode) with the directory sharing: `docker run --name gcc-arm-none-eabi-container --rm -v absolute/path/to/your/project/:/share -d -it gcc-arm-none-eabi sh`
3. Every time you want to build your project then from the console or the IDE issue the following command: `docker exec gcc-arm-none-eabi-container sh -c "cd /share && make"`
4. After your done you can stop the container by issuing: `docker stop gcc-arm-none-eabi-container`
