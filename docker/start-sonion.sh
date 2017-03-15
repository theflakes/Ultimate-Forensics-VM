#!/bin/sh
#
# start SecurityOnion docker and allow GUI applications to display

xhost +local:docker
docker run -it --rm -e DISPLAY=$DISPLAY \
	--privileged \
	-v /tmp/.X11-unix/:/tmp/.X11-unix \
	-v /etc/localtime:/etc/localtime:ro \
        -v $HOME/Downloads:/root/Downloads \
        -v $HOME/Pictures:/root/Pictures \
        -v $HOME/Torrents:/root/Torrents \
        -v $HOME/.chrome:/data \
        -v /dev/shm:/dev/shm \
        -v /etc/hosts:/etc/hosts \
        --device /dev/snd \
        --device /dev/dri \
        --group-add audio \
        --group-add video \
	      sonion 
