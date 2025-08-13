#!/bin/sh

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

ffmpeg -f lavfi -i smptebars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec libsvtav1 -s 720x576 -r 25 -frames:v 1000 01-smptebars-0000.mkv

ffmpeg -f lavfi -i smptebars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec libsvtav1 -s 720x480 -r 30000/1001 -frames:v 1000 01-smptebars-0001.mkv

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec libsvtav1 -s 720x576 -r 25 -frames:v 1000 02-smptehdbars-0000.mkv

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec libsvtav1 -s 720x480 -r 30000/1001 -frames:v 1000 02-smptehdbars-0001.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec libsvtav1 -s 720x576 -r 25 -frames:v 1000 03-testsrc-0000.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec libsvtav1 -s 720x480 -r 30000/1001 -frames:v 1000 03-testsrc-0001.mkv

ffmpeg -f lavfi -i rgbtestsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec libsvtav1 -s 720x576 -r 25 -frames:v 1000 04-rgbtestsrc-0000.mkv

ffmpeg -f lavfi -i rgbtestsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec libsvtav1 -s 720x480 -r 30000/1001 -frames:v 1000 04-rgbtestsrc-0001.mkv

ffmpeg -f lavfi -i mandelbrot=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec libsvtav1 -s 720x576 -r 25 -frames:v 1000 05-mandelbrot-0000.mkv

ffmpeg -f lavfi -i mandelbrot=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec libsvtav1 -s 720x480 -r 30000/1001 -frames:v 1000 05-mandelbrot-0001.mkv

melt -profile dv_pal -group in=0 out=1000 \
  frei0r.test_pat_B 0=5 1=0 \
  -consumer avformat:06-philips-pm5544-0000-00.dv

melt -profile dv_ntsc -group in=0 out=1000 \
  frei0r.test_pat_B 0=5 1=0 \
  -consumer avformat:06-philips-pm5544-0000-01.dv

ffmpeg -i 06-philips-pm5544-0000-00.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec libsvtav1 -s 720x576 -r 25 06-philips-pm5544-0000.mkv

ffmpeg -i 06-philips-pm5544-0000-01.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec libsvtav1 -s 720x480 -r 30000/1001 06-philips-pm5544-0001.mkv

rm 06-philips-pm5544-0000-00.dv

rm 06-philips-pm5544-0000-01.dv

melt -profile dv_pal -group in=0 out=1000 \
  frei0r.test_pat_B 0=6 1=0 \
  -consumer avformat:07-fubk-0000-00.dv

melt -profile dv_ntsc -group in=0 out=1000 \
  frei0r.test_pat_B 0=6 1=0 \
  -consumer avformat:07-fubk-0000-01.dv

ffmpeg -i 07-fubk-0000-00.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec libsvtav1 -s 720x576 -r 25 07-fubk-0000.mkv

ffmpeg -i 07-fubk-0000-01.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec libsvtav1 -s 720x480 -r 30000/1001 07-fubk-0001.mkv

rm 07-fubk-0000-00.dv

rm 07-fubk-0000-01.dv

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec libsvtav1 -s 720x576 -r 25 -frames:v 1000 08-smpte-0000.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec libopus -vcodec libsvtav1 -s 720x480 -r 30000/1001 -frames:v 1000 08-smpte-0001.mkv

