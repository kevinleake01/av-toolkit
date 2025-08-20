#!/bin/sh

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

ffmpeg -f lavfi -i colorchart=patch_size=64x64:preset=reference \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 00_colorchart_smpte_pal.dv

