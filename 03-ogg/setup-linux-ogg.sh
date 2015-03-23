#!/bin/sh

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

mkdir 00-samples
cd 00-samples
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
cd ../

ffmpeg -f lavfi -i smptebars=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-vcd -frames:v 1000 01-smptebars-0000.mpg

ffmpeg -f lavfi -i smptebars=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-svcd -frames:v 1000 01-smptebars-0001.mpg

ffmpeg -f lavfi -i smptebars=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dvd -frames:v 1000 01-smptebars-0002.mpg

ffmpeg -f lavfi -i smptebars=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-vcd -frames:v 1000 01-smptebars-0003.mpg

ffmpeg -f lavfi -i smptebars=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-svcd -frames:v 1000 01-smptebars-0004.mpg

ffmpeg -f lavfi -i smptebars=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-dvd -frames:v 1000 01-smptebars-0005.mpg

ffmpeg -f lavfi -i smptehdbars=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-vcd -frames:v 1000 02-smptehdbars-0000.mpg

ffmpeg -f lavfi -i smptehdbars=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-svcd -frames:v 1000 02-smptehdbars-0001.mpg

ffmpeg -f lavfi -i smptehdbars=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dvd -frames:v 1000 02-smptehdbars-0002.mpg

ffmpeg -f lavfi -i smptehdbars=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-vcd -frames:v 1000 02-smptehdbars-0003.mpg

ffmpeg -f lavfi -i smptehdbars=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-svcd -frames:v 1000 02-smptehdbars-0004.mpg

ffmpeg -f lavfi -i smptehdbars=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-dvd -frames:v 1000 02-smptehdbars-0005.mpg

ffmpeg -f lavfi -i testsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-vcd -frames:v 1000 03-testsrc-0000.mpg

ffmpeg -f lavfi -i testsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-svcd -frames:v 1000 03-testsrc-0001.mpg

ffmpeg -f lavfi -i testsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dvd -frames:v 1000 03-testsrc-0002.mpg

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-vcd -frames:v 1000 03-testsrc-0003.mpg

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-svcd -frames:v 1000 03-testsrc-0004.mpg

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-dvd -frames:v 1000 03-testsrc-0005.mpg

ffmpeg -f lavfi -i rgbtestsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-vcd -frames:v 1000 04-rgbtestsrc-0000.mpg

ffmpeg -f lavfi -i rgbtestsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-svcd -frames:v 1000 04-rgbtestsrc-0001.mpg

ffmpeg -f lavfi -i rgbtestsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dvd -frames:v 1000 04-rgbtestsrc-0002.mpg

ffmpeg -f lavfi -i rgbtestsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-vcd -frames:v 1000 04-rgbtestsrc-0003.mpg

ffmpeg -f lavfi -i rgbtestsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-svcd -frames:v 1000 04-rgbtestsrc-0004.mpg

ffmpeg -f lavfi -i rgbtestsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-dvd -frames:v 1000 04-rgbtestsrc-0005.mpg

ffmpeg -f lavfi -i mandelbrot=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-vcd -frames:v 1000 05-mandelbrot-0000.mpg

ffmpeg -f lavfi -i mandelbrot=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-svcd -frames:v 1000 05-mandelbrot-0001.mpg

ffmpeg -f lavfi -i mandelbrot=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dvd -frames:v 1000 05-mandelbrot-0002.mpg

ffmpeg -f lavfi -i mandelbrot=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-vcd -frames:v 1000 05-mandelbrot-0003.mpg

ffmpeg -f lavfi -i mandelbrot=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-svcd -frames:v 1000 05-mandelbrot-0004.mpg

ffmpeg -f lavfi -i mandelbrot=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-dvd -frames:v 1000 05-mandelbrot-0005.mpg

ffmpeg -f lavfi -i testsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-vcd -frames:v 1000 06-smpte-0000.mpg

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-vcd -frames:v 1000 06-smpte-0001.mpg

ffmpeg -f lavfi -i testsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-svcd -frames:v 1000 06-smpte-0002.mpg

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-svcd -frames:v 1000 06-smpte-0003.mpg

ffmpeg -f lavfi -i testsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dvd -frames:v 1000 06-smpte-0004.mpg

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dvd -frames:v 1000 06-smpte-0005.mpg

ffmpeg2theora 01-smptebars-0000.mpg
ffmpeg2theora 01-smptebars-0001.mpg
ffmpeg2theora 01-smptebars-0002.mpg
ffmpeg2theora 01-smptebars-0003.mpg
ffmpeg2theora 01-smptebars-0004.mpg
ffmpeg2theora 01-smptebars-0005.mpg

ffmpeg2theora 02-smptehdbars-0000.mpg
ffmpeg2theora 02-smptehdbars-0001.mpg
ffmpeg2theora 02-smptehdbars-0002.mpg
ffmpeg2theora 02-smptehdbars-0003.mpg
ffmpeg2theora 02-smptehdbars-0004.mpg
ffmpeg2theora 02-smptehdbars-0005.mpg

ffmpeg2theora 03-testsrc-0000.mpg
ffmpeg2theora 03-testsrc-0001.mpg
ffmpeg2theora 03-testsrc-0002.mpg
ffmpeg2theora 03-testsrc-0003.mpg
ffmpeg2theora 03-testsrc-0004.mpg
ffmpeg2theora 03-testsrc-0005.mpg

ffmpeg2theora 04-rgbtestsrc-0000.mpg
ffmpeg2theora 04-rgbtestsrc-0001.mpg
ffmpeg2theora 04-rgbtestsrc-0002.mpg
ffmpeg2theora 04-rgbtestsrc-0003.mpg
ffmpeg2theora 04-rgbtestsrc-0004.mpg
ffmpeg2theora 04-rgbtestsrc-0005.mpg

ffmpeg2theora 05-mandelbrot-0000.mpg
ffmpeg2theora 05-mandelbrot-0001.mpg
ffmpeg2theora 05-mandelbrot-0002.mpg
ffmpeg2theora 05-mandelbrot-0003.mpg
ffmpeg2theora 05-mandelbrot-0004.mpg
ffmpeg2theora 05-mandelbrot-0005.mpg

ffmpeg2theora 06-smpte-0000.mpg
ffmpeg2theora 06-smpte-0001.mpg
ffmpeg2theora 06-smpte-0002.mpg
ffmpeg2theora 06-smpte-0003.mpg
ffmpeg2theora 06-smpte-0004.mpg
ffmpeg2theora 06-smpte-0005.mpg

rm *.png

