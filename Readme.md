# Docklean - Docker Management CLI

A powerful command-line interface for managing Docker resources, including containers, images, networks, and volumes.

## Installation

1. Clone this repository or download the `docklean.sh` script
2. Make the script executable:
```bash
chmod +x docklean.sh
```

## Usage

### Basic Commands

```bash
./docklean.sh {command}
```

### Available Commands

#### Cleaning Commands
- `clean`: Remove all stopped containers
- `rm-images`: Remove all dangling images
- `stop-clean`: Stop all containers and then remove them

#### Listing Resources
```bash
./docklean.sh list {resource_type}
```
Available resource types:
- `containers`: List all containers (running and stopped)
- `images`: List all Docker images
- `networks`: List all Docker networks
- `volumes`: List all Docker volumes

#### Inspecting Resources
```bash
./docklean.sh inspect {resource_type} {resource_id/name}
```
Available resource types:
- `container`: Inspect a specific container
- `image`: Inspect a specific image
- `network`: Inspect a specific network
- `volume`: Inspect a specific volume

#### Help
```bash
./docklean.sh help
# or
./docklean.sh --help
# or
./docklean.sh -h
```

## Examples

1. List all containers:
```bash
./docklean.sh list containers
```

2. Inspect a specific container:
```bash
./docklean.sh inspect container my-container
```

3. Remove all stopped containers:
```bash
./docklean.sh clean
```

4. Remove all dangling images:
```bash
./docklean.sh rm-images
```

5. Stop and remove all containers:
```bash
./docklean.sh stop-clean
```

## Features

- **Container Management**: View, inspect, and clean up containers
- **Image Management**: View, inspect, and remove dangling images
- **Network Management**: View and inspect Docker networks
- **Volume Management**: View and inspect Docker volumes
- **Interactive Help**: Comprehensive help system with command documentation

## Requirements

- Docker installed on your system
- Bash shell
- Linux/Unix-like operating system or WSL for Windows users