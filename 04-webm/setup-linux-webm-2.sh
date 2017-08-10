#!/bin/sh

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

ffmpeg -f lavfi -i smptebars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec vp8 -s 720x576 -r 25 -frames:v 1000 00_smptebars_tcode_pal_vp8.webm

ffmpeg -f lavfi -i smptebars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec vp8 -s 720x480 -r 30000/1001 -frames:v 1000 00_smptebars_tcode_ntsc_vp8.webm

ffmpeg -f lavfi -i smptebars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec vp9 -s 720x576 -r 25 -frames:v 1000 00_smptebars_tcode_pal_vp9.webm

ffmpeg -f lavfi -i smptebars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec vp9 -s 720x480 -r 30000/1001 -frames:v 1000 00_smptebars_tcode_ntsc_vp9.webm

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec vp8 -s 720x576 -r 25 -frames:v 1000 00_testsrc_tcode_pal_vp8.webm

ffmpeg -f lavfi -i testsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec vp8 -s 720x480 -r 30000/1001 -frames:v 1000 00_testsrc_tcode_ntsc_vp8.webm

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec vp9 -s 720x576 -r 25 -frames:v 1000 00_testsrc_tcode_pal_vp9.webm

ffmpeg -f lavfi -i testsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec vp9 -s 720x480 -r 30000/1001 -frames:v 1000 00_testsrc_tcode_ntsc_vp9.webm

