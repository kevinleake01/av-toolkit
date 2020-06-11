#!/bin/sh

ffmpeg -f lavfi -i testsrc2=s=640x480:r=1 \
  -frames:v 10 00_testsrc2_640x480_%04d.png


