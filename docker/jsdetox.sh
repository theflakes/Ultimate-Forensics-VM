#!/bin/sh
action="$1"

case $action in
        start)
                sudo start docker
                sudo docker run --rm -p 3000:3000 remnux/jsdetox
        ;;
        stop)
                sudo docker stop `sudo docker ps -l | awk END{print} | awk '{print $1}'`
        ;;
        *)
                echo "Usage: $0 {start|stop}"
                exit 1
esac
