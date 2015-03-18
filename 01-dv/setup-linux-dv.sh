#!/bin/sh

# This program creates various DV videos to practice your editing. It requires
# MLT (Melt), and FFmpeg (Libav).

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

ffmpeg -f lavfi -i smptebars \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 01-smptebars-0000.dv

ffmpeg -f lavfi -i smptehdbars \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 01-smptebars-0001.dv

ffmpeg -f lavfi -i testsrc \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 02-testsrc-0000.dv

ffmpeg -i 02-testsrc-0000.dv -vf lutrgb=g=0:b=0 -target pal-dv 02-testsrc-0001.dv

ffmpeg -i 02-testsrc-0000.dv -vf lutrgb=r=0:b=0 -target pal-dv 02-testsrc-0002.dv

ffmpeg -i 02-testsrc-0000.dv -vf lutrgb=r=0:g=0 -target pal-dv 02-testsrc-0003.dv

ffmpeg -f lavfi -i rgbtestsrc \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 03-rgbtestsrc-0000.dv

melt -profile dv_pal -group in=0 out=1000 \
  frei0r.test_pat_B 0=5 1=0 \
  -consumer avformat:04-philips-pm5544-0000.dv

ffmpeg -i 04-philips-pm5544-0000.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dv 04-philips-pm5544-0001.dv

melt -profile dv_pal -group in=0 out=1000 \
  frei0r.test_pat_B 0=6 1=0 \
  -consumer avformat:05-fubk-0000.dv

ffmpeg -i 05-fubk-0000.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dv 05-fubk-0001.dv

melt -profile dv_ntsc -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:06-timecode-0000.dv

melt -profile dv_ntsc -group in=0 out=1000 \
  count direction=up style=frames sound=frame0 \
  -consumer avformat:07-frames-0000.dv

ffmpeg -f lavfi -i mandelbrot \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 08-mandelbrot-0000.dv

ffmpeg -i 08-mandelbrot-0000.dv -vf lutrgb=g=0:b=0 -target pal-dv 08-mandelbrot-0001.dv

ffmpeg -i 08-mandelbrot-0000.dv -vf lutrgb=r=0:b=0 -target pal-dv 08-mandelbrot-0002.dv

ffmpeg -i 08-mandelbrot-0000.dv -vf lutrgb=r=0:g=0 -target pal-dv 08-mandelbrot-0003.dv

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 02-testsrc-0004.dv




