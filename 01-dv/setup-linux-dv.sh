#!/bin/sh

# This program creates various DV videos to practice your editing. It requires
MLT (Melt), and FFmpeg (Libav).

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

ffmpeg -f lavfi -i smptebars \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=15: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 01-smptebars.dv

ffmpeg -f lavfi -i testsrc \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=15: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 02-testsrc-0000.dv

ffmpeg -i 02-testsrc-0000.dv -vf lutrgb=g=0:b=0 -target ntsc-dv 02-testsrc-0001.dv

ffmpeg -i 02-testsrc-0000.dv -vf lutrgb=r=0:b=0 -target ntsc-dv 02-testsrc-0002.dv

ffmpeg -i 02-testsrc-0000.dv -vf lutrgb=r=0:g=0 -target ntsc-dv 02-testsrc-0003.dv



