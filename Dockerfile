# Use the official GCC image as the base image
FROM gcc:latest

RUN apt-get update && apt-get install -y cmake gdb git

# Set the working directory inside the container
WORKDIR /workspace

# Copy the .bashrc file to the home directory of the root user
COPY _bashrc /root/.bashrc

# Declare the mount point as a volume
VOLUME ["/workspace"]

# Start an interactive shell as the default command
CMD ["/bin/bash"]
