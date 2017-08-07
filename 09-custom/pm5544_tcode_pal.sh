#!/bin/sh

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

melt -profile dv_pal -group in=0 out=1000 \
  frei0r.test_pat_B 0=5 1=0 \
  -consumer avformat:00_temp.dv

ffmpeg -i 00_temp.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dv 00_pm5544_tcode_pal.dv

rm 00_temp.dv

