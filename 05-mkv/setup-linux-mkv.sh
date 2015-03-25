#!/bin/sh

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

ffmpeg -f lavfi -i testsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 01-testsrc-0000.mkv

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 01-testsrc-0001.mkv

ffmpeg -f lavfi -i testsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-vcd -frames:v 1000 01-testsrc-0002.mkv

ffmpeg -f lavfi -i testsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-svcd -frames:v 1000 01-testsrc-0003.mkv

ffmpeg -f lavfi -i testsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dvd -frames:v 1000 01-testsrc-0004.mkv

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-vcd -frames:v 1000 01-testsrc-0005.mkv

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-svcd -frames:v 1000 01-testsrc-0006.mkv

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-dvd -frames:v 1000 01-testsrc-0007.mkv

ffmpeg -f lavfi -i testsrc=r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target film-dvd -frames:v 1000 01-testsrc-0008.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -frames:v 1000 01-testsrc-0009.mkv

ffmpeg -f lavfi -i testsrc=s=1280x720:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -frames:v 1000 01-testsrc-0010.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec vp8 -frames:v 1000 01-testsrc-0011.mkv

ffmpeg -f lavfi -i testsrc=s=1280x720:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec vp8 -frames:v 1000 01-testsrc-0012.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec opus -vcodec vp9 -frames:v 1000 01-testsrc-0013.mkv

ffmpeg -f lavfi -i testsrc=s=1280x720:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec opus -vcodec vp9 -frames:v 1000 01-testsrc-0014.mkv

ffmpeg -f lavfi -i testsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 02-smpte-0000.mkv

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 02-smpte-0001.mkv

ffmpeg -f lavfi -i testsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-vcd -frames:v 1000 02-smpte-0002.mkv

ffmpeg -f lavfi -i testsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-svcd -frames:v 1000 02-smpte-0003.mkv

ffmpeg -f lavfi -i testsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dvd -frames:v 1000 02-smpte-0004.mkv

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-vcd -frames:v 1000 02-smpte-0005.mkv

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-svcd -frames:v 1000 02-smpte-0006.mkv

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dvd -frames:v 1000 02-smpte-0007.mkv

ffmpeg -f lavfi -i testsrc=r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-dvd -frames:v 1000 02-smpte-0008.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -frames:v 1000 02-smpte-0009.mkv

ffmpeg -f lavfi -i testsrc=s=1280x720:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -frames:v 1000 02-smpte-0010.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec vp8 -frames:v 1000 02-smpte-0011.mkv

ffmpeg -f lavfi -i testsrc=s=1280x720:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec vp8 -frames:v 1000 02-smpte-0012.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec opus -vcodec vp9 -frames:v 1000 02-smpte-0013.mkv

ffmpeg -f lavfi -i testsrc=s=1280x720:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec opus -vcodec vp9 -frames:v 1000 02-smpte-0014.mkv




