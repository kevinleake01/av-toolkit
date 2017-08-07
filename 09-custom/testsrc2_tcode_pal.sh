#!/bin/sh

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

ffmpeg -f lavfi -i testsrc2=s=640x480:r=25 \
  -target pal-dv -frames:v 1000 00_testsrc2_tcode_pal.dv

