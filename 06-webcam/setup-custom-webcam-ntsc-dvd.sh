#!/bin/sh

# This script a MPEG video file from a webcam. Example usage:
#
# ./setup-custom-webcam-ntsc-dvd.sh 640x480 10 webcamfile-0001 1000

ffmpeg -f v4l2 -s $1 -r $2 -i /dev/video0 \
  -target ntsc-dvd -frames:v $4 00_$3.mpg

