#!/bin/bash

# Create a _bash_history file if it doesn't exist
touch "_bash_history"

# Container name
CONTAINER_NAME="devenv-gcc-1"

# Function to check if a container is running
is_container_running() {
    docker ps | grep "$CONTAINER_NAME" >/dev/null
}

# Function to stop the container if it is running
stop_container() {
    if is_container_running; then
        echo "Stopping the container..."
        docker stop "$CONTAINER_NAME"
    else
        echo "Container is not running."
    fi
}

# Function to start the container
start_container() {
    # Start the environment using docker-compose
    docker-compose up -d --build
}

# Function to connect to the running container
run_container() {
    if is_container_running; then
        echo "Environment already running - connecting..."
        if command -v winpty >/dev/null 2>&1; then
            winpty docker exec -it "$CONTAINER_NAME" bash
        else
            docker exec -it "$CONTAINER_NAME" bash
        fi
    else
        echo "Container is not running. Please start the container first."
    fi
}

# Check the first argument
case "$1" in
    start)
        start_container
        ;;
    run)
        run_container
        ;;
    stop)
        stop_container
        ;;
    *)
        echo "Usage: $0 {start|run|stop}"
        exit 1
        ;;
esac
