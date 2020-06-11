#!/bin/sh

ffmpeg -f lavfi -i testsrc2=s=2560x1920:r=1 \
  -frames:v 10 00_testsrc2_5MP_%04d.png


