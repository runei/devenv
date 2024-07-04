```markdown
# GCC Development Environment

This project sets up a GCC-based development environment using Docker. The environment includes essential tools like `cmake`, `gdb`, and `git`, and allows for interactive development inside a Docker container.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
- [Configuration](#configuration)
- [Files](#files)
- [License](#license)

## Prerequisites

- Docker
- Docker Compose

Ensure you have both Docker and Docker Compose installed on your machine before proceeding with the setup.

## Setup

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Build and start the Docker container:**
   ```bash
   ./start.sh start
   ```

## Usage

The `start.sh` script provides commands to manage the development environment.

- **Start the environment:**
  ```bash
  ./start.sh start
  ```

- **Connect to the running container:**
  ```bash
  ./start.sh run
  ```

- **Stop the environment:**
  ```bash
  ./start.sh stop
  ```

### Notes
- The container mounts the `../hello` directory to `/workspace/hello` inside the container. Make sure this path exists on your host machine.
- The default command for the container is to start an interactive bash shell.

## Configuration

### Dockerfile

The `Dockerfile` is used to build the Docker image. It includes the following steps:
- Using the official `gcc` image as the base image.
- Installing `cmake`, `gdb`, and `git`.
- Setting the working directory to `/workspace`.
- Copying a custom `.bashrc` file to the root user's home directory.
- Declaring `/workspace` as a volume.
- Setting `/bin/bash` as the default command.

### docker-compose.yml

The `docker-compose.yml` defines the service configuration:
- Builds the image using the `Dockerfile`.
- Enables TTY and stdin for interactive sessions.

### _bashrc

The `_bashrc` file configures the shell environment with color support for various commands and sets a custom prompt that shows the current Git branch if inside a Git repository.

### start.sh

The `start.sh` script provides a convenient way to manage the Docker container. It includes functions to:
- Check if the container is running.
- Stop the container if it is running.
- Start the container using `docker-compose`.
- Connect to the running container.

### _bash_history

The `_bash_history` file is created if it does not exist to ensure command history is preserved.

## Files

- `Dockerfile`: Defines the Docker image.
- `docker-compose.yml`: Defines the Docker Compose configuration.
- `_bashrc`: Custom bash configuration.
- `start.sh`: Script to manage the Docker container.
- `_bash_history`: File to preserve command history.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
```
