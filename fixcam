#!/bin/bash
echo "This will only work after disconnecting and reconnecting the cam"
echo "Fixing webcam..."
sudo modprobe -r uvcvideo
sudo modprobe uvcvideo
sudo systemctl restart zoneminder.service
echo "Webcam restarted"
