#!/bin/sh

# This program creates various OGG Theora videos to practice your editing. It requires
# MLT (Melt), FFmpeg (Libav), and FFmpeg2theora.

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

ffmpeg -f lavfi -i testsrc \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-vcd -frames:v 1000 01-testsrc-0000.mpg

ffmpeg2theora 01-testsrc-0000.mpg

ffmpeg -f lavfi -i smptebars=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-vcd -frames:v 1000 02-smptebars-0000.mpg

ffmpeg2theora 02-smptebars-0000.mpg

rm 01-testsrc-0000.mpg

rm 02-smptebars-0000.mpg

wget http://v2v.cc/~j/theora_testsuite/320x240.ogg
wget http://v2v.cc/~j/theora_testsuite/320x240.ogv
wget http://v2v.cc/~j/theora_testsuite/320x240.skeleton+cmml.ogv
wget http://v2v.cc/~j/theora_testsuite/pixel_aspect_ratio.ogg
wget http://v2v.cc/~j/theora_testsuite/videotestsrc-720x576-16-15.ogg
wget http://v2v.cc/~j/theora_testsuite/322x242_not-divisible-by-sixteen-framesize.ogg
wget http://v2v.cc/~j/theora_testsuite/chained_streams.ogg
wget http://v2v.cc/~j/theora_testsuite/multi2.ogg
wget http://v2v.cc/~j/theora_testsuite/mobile_itu601_i_422.ogg
wget http://v2v.cc/~j/theora_testsuite/ducks_take_off_444_720p25.ogg
wget http://v2v.cc/~j/theora_testsuite/stockholm-vfr.ogg
wget http://v2v.cc/~j/theora_testsuite/offset_test.ogv
wget http://v2v.cc/~j/theora_testsuite/sign_irene_cif-3qi-b.ogg
wget http://v2v.cc/~j/theora_testsuite/chroma_siting_test.ogv
wget http://v2v.cc/~j/theora_testsuite/0byteframes.ogv

