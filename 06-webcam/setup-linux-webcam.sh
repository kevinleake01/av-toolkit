#!/bin/sh

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

ffmpeg -f v4l2 -s 640x480 -r 10 -i /dev/video0 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 01-webcam-0000.dv

ffmpeg -f v4l2 -s 640x480 -r 10 -i /dev/video0 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -frames:v 1000 01-webcam-0001.mkv

ffmpeg -f v4l2 -s 640x480 -r 10 -i /dev/video0 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{gmtime} UTC': box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 01-webcam-0002.dv

ffmpeg -f v4l2 -s 640x480 -r 10 -i /dev/video0 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{gmtime} UTC': box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 01-webcam-0003.dv

ffmpeg -f v4l2 -s 640x480 -r 10 -i /dev/video0 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{gmtime} UTC': box=1: boxcolor=0x000000@1" \
  -frames:v 1000 01-webcam-0004.mkv


