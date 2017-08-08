#!/bin/sh

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

ffmpeg -f lavfi -i smptebars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 -frames:v 1000 00_smptebars_tcode_pal_theora.ogv

ffmpeg -f lavfi -i smptebars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 -frames:v 1000 00_smptebars_tcode_ntsc_theora.ogv

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 -frames:v 1000 00_testsrc_tcode_pal_theora.ogv

ffmpeg -f lavfi -i testsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 -frames:v 1000 00_testsrc_tcode_ntsc_theora.ogv

