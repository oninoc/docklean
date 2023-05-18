#!/bin/bash

case "$1" in
    clean)
        # this option remove all containers stoped
        docker rm $(docker ps -a -q)
        ;;
    rm-images)
        # this option remove all images with tag none
        docker image rm $(docker images -q -f dangling="true")
        ;;
    stop-clean)
        # this option stopped all containers and then remove
        docker stop $(docker ps) && docker rm $(docker ps -a -q)
        ;;
    *)
        echo " Usage: $0 {clean|rm-images|stop-clean} "
        exit 1
        ;;
esac