#!/bin/sh

ffmpeg -f lavfi -i testsrc=s=3264x2448:r=1 \
  -frames:v 10 00_testsrc_8MP_%04d.png


