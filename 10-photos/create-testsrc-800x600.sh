#!/bin/sh

ffmpeg -f lavfi -i testsrc=s=800x600:r=1 \
  -frames:v 10 00_testsrc_800x600_%04d.png


