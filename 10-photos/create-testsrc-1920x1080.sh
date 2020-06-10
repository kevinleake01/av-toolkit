#!/bin/sh

ffmpeg -f lavfi -i testsrc=s=1920x1080:r=1 \
  -frames:v 10 00_testsrc_1920x1080_%04d.png


