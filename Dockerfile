# Use the official ROC streaming image as the base image
FROM rocstreaming/env-archlinux:latest


# Set git global variables
RUN git config --global user.email "lminvernizzi@gmail.com"
RUN git config --global user.name "Leonardo Invernizzi"

# Set the working directory inside the container
WORKDIR /workspace

# Copy the .bashrc file to the home directory of the root user
COPY _bashrc /root/.bashrc

# Declare the mount point as a volume
VOLUME ["/workspace"]

# Start an interactive shell as the default command
CMD ["/bin/bash"]
