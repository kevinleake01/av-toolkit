#!/bin/sh

ffmpeg -f lavfi -i testsrc=s=640x480:r=1 \
  -frames:v 10 00_testsrc_640x480_%04d.png


