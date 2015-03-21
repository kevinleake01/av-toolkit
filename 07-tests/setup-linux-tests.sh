#!/bin/sh

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

ffmpeg -f lavfi -i testsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 01-smpte-0000.dv

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 01-smpte-0001.dv

ffmpeg -f lavfi -i testsrc=s=640x480:r=10 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -frames:v 1000 02-lowframerate-0000.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=5 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -frames:v 1000 02-lowframerate-0001.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=1 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -frames:v 1000 02-lowframerate-0002.mkv

ffmpeg -f lavfi -i testsrc=s=512x512:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -s 512x512 -frames:v 1000 03-sizetest-0000.mkv

ffmpeg -f lavfi -i testsrc=s=945x370:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -s 945x370 -frames:v 1000 03-sizetest-0001.mkv

ffmpeg -f lavfi -i testsrc=s=373x919:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -s 373x919 -frames:v 1000 03-sizetest-0002.mkv

