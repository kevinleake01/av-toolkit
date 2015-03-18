#!/bin/sh

# This program creates various Webm videos to practice your editing. It requires
# MLT (Melt), and FFmpeg (Libav).

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -frames:v 1000 01-testsrc-0000.webm

ffmpeg -f lavfi -i testsrc=s=1280x720:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -frames:v 1000 01-testsrc-0001.webm

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec opus -vcodec vp9 -frames:v 1000 01-testsrc-0002.webm

ffmpeg -f lavfi -i testsrc=s=1280x720:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec opus -vcodec vp9 -frames:v 1000 01-testsrc-0003.webm



