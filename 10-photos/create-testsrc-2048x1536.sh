#!/bin/sh

ffmpeg -f lavfi -i testsrc=s=2048x1536:r=1 \
  -frames:v 10 00_testsrc_3MP_%04d.png


