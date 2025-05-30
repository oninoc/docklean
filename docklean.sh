#!/bin/bash

# Function to display help message
show_help() {
    echo "Docklean - Docker Management CLI"
    echo "Usage: $0 {command}"
    echo ""
    echo "Commands:"
    echo "  clean         - Remove all stopped containers"
    echo "  rm-images     - Remove all dangling images"
    echo "  stop-clean    - Stop all containers and then remove them"
    echo "  inspect       - Inspect Docker resources"
    echo "  list          - List Docker resources"
    echo ""
    echo "Inspect options:"
    echo "  $0 inspect container <container_id>  - Inspect specific container"
    echo "  $0 inspect image <image_id>         - Inspect specific image"
    echo "  $0 inspect network <network_id>     - Inspect specific network"
    echo "  $0 inspect volume <volume_name>     - Inspect specific volume"
    echo ""
    echo "List options:"
    echo "  $0 list containers  - List all containers"
    echo "  $0 list images      - List all images"
    echo "  $0 list networks    - List all networks"
    echo "  $0 list volumes     - List all volumes"
}

# Function to list Docker resources
list_resources() {
    case "$2" in
        containers)
            echo "=== Running Containers ==="
            docker ps
            echo -e "\n=== All Containers ==="
            docker ps -a
            ;;
        images)
            echo "=== Docker Images ==="
            docker images
            ;;
        networks)
            echo "=== Docker Networks ==="
            docker network ls
            ;;
        volumes)
            echo "=== Docker Volumes ==="
            docker volume ls
            ;;
        *)
            echo "Invalid resource type. Use: containers, images, networks, or volumes"
            exit 1
            ;;
    esac
}

# Function to inspect Docker resources
inspect_resource() {
    if [ -z "$3" ]; then
        echo "Error: Resource ID/name required"
        echo "Usage: $0 inspect {container|image|network|volume} <id/name>"
        exit 1
    fi

    case "$2" in
        container)
            docker inspect "$3"
            ;;
        image)
            docker image inspect "$3"
            ;;
        network)
            docker network inspect "$3"
            ;;
        volume)
            docker volume inspect "$3"
            ;;
        *)
            echo "Invalid resource type. Use: container, image, network, or volume"
            exit 1
            ;;
    esac
}

case "$1" in
    clean)
        # Remove all stopped containers
        docker rm $(docker ps -a -q)
        ;;
    rm-images)
        # Remove all dangling images
        docker image rm $(docker images -q -f dangling="true")
        ;;
    stop-clean)
        # Stop all containers and then remove them
        docker stop $(docker ps -q) && docker rm $(docker ps -a -q)
        ;;
    inspect)
        inspect_resource "$@"
        ;;
    list)
        list_resources "$@"
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        echo "Unknown command: $1"
        show_help
        exit 1
        ;;
esac