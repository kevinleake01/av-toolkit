#!/bin/sh

ffmpeg -f lavfi -i testsrc=s=2560x1920:r=1 \
  -frames:v 10 00_testsrc_5MP_%04d.png


