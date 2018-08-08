#!/bin/bash
sudo docker run -d --restart=unless-stopped -p 8080:80 -v /dev/snd:/dev/snd -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --privileged --name shot get-shot
