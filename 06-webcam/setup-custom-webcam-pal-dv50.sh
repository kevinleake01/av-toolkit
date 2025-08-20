#!/bin/sh

# This script a DV50 video file from a webcam. Example usage:
#
# ./setup-custom-webcam-pal-dv50.sh 640x480 10 webcamfile-0001 1000

ffmpeg -f v4l2 -s $1 -r $2 -i /dev/video0 \
  -target pal-dv50 -frames:v $4 00_$3.dv

