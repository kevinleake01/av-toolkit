#!/bin/sh

ffmpeg -f lavfi -i testsrc2=s=640x480:r=30000/1001 \
  -target ntsc-dv -frames:v 1000 00_testsrc2_tcode_ntsc.dv

