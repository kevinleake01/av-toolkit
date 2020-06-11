#!/bin/sh

ffmpeg -f lavfi -i testsrc2=s=1920x1080:r=1 \
  -frames:v 10 00_testsrc2_1920x1080_%04d.png


