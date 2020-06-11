#!/bin/sh

ffmpeg -f lavfi -i testsrc2=s=800x600:r=1 \
  -frames:v 10 00_testsrc2_800x600_%04d.png


