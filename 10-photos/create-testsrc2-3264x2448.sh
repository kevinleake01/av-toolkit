#!/bin/sh

ffmpeg -f lavfi -i testsrc2=s=3264x2448:r=1 \
  -frames:v 10 00_testsrc2_8MP_%04d.png


