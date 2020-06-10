#!/bin/sh

ffmpeg -f lavfi -i testsrc=s=1280x720:r=1 \
  -frames:v 10 00_testsrc_1280x720_%04d.png


