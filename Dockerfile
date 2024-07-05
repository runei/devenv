# Use the official GCC image as the base image
FROM gcc:latest

RUN apt-get update && apt-get install -y build-essential cmake gdb git

############# roc-toolkit #############

RUN apt-get install -y scons doxygen libuv1-dev libunwind-dev pkg-config libtool intltool libglib2.0-dev libjson-c-dev libsndfile1-dev libcap-dev libasound2-dev libavahi-client-dev libsamplerate0-dev libspeexdsp-dev libtdb-dev libltdl-dev libudev-dev libxcb1-dev libice-dev libsm-dev libxtst-dev libx11-dev libpulse-dev autoconf automake libvorbis-dev libmp3lame-dev libmad0-dev libopencore-amrnb-dev libopencore-amrwb-dev libflac-dev libmpg123-dev libwavpack-dev libavcodec-dev libavformat-dev libsoxr-dev

########### end roc-toolkit ###########

# Set the working directory inside the container
WORKDIR /workspace

# Copy the .bashrc file to the home directory of the root user
COPY _bashrc /root/.bashrc

# Declare the mount point as a volume
VOLUME ["/workspace"]

# Start an interactive shell as the default command
CMD ["/bin/bash"]
