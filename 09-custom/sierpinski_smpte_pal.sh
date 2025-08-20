#!/bin/sh

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

ffmpeg -f lavfi -i sierpinski=s=640x480:type=carpet:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 00_sierpinski_smpte_pal.dv

