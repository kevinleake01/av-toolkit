#!/bin/sh

# This script creates Ogg Theora video files. Example usage:
#
# ./setup-ogg.sh 1000

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

mkdir 00_samples_$1
cd 00_samples_$1

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

mkdir 01_ogg_theora_$1
cd 01_ogg_theora_$1

ffmpeg -f lavfi -i smptebars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 -frames:v $1 00_smptebars_tcode_pal.ogg

ffmpeg -f lavfi -i smptebars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $1 00_smptebars_tcode_ntsc.ogg

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 -frames:v $1 00_smptehdbars_tcode_pal.ogg

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $1 00_smptehdbars_tcode_ntsc.ogg

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 -frames:v $1 00_testsrc_tcode_pal.ogg

ffmpeg -f lavfi -i testsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $1 00_testsrc_tcode_ntsc.ogg

ffmpeg -i 00_testsrc_tcode_pal.ogg -vf lutrgb=g=0:b=0 00_testsrc_tcode_red_pal.ogg

ffmpeg -i 00_testsrc_tcode_pal.ogg -vf lutrgb=r=0:b=0 00_testsrc_tcode_green_pal.ogg

ffmpeg -i 00_testsrc_tcode_pal.ogg -vf lutrgb=r=0:g=0 00_testsrc_tcode_blue_pal.ogg

ffmpeg -i 00_testsrc_tcode_ntsc.ogg -vf lutrgb=g=0:b=0 00_testsrc_tcode_red_ntsc.ogg

ffmpeg -i 00_testsrc_tcode_ntsc.ogg -vf lutrgb=r=0:b=0 00_testsrc_tcode_green_ntsc.ogg

ffmpeg -i 00_testsrc_tcode_ntsc.ogg -vf lutrgb=r=0:g=0 00_testsrc_tcode_blue_ntsc.ogg

ffmpeg -f lavfi -i mandelbrot=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 -frames:v $1 00_mandelbrot_tcode_pal.ogg

ffmpeg -f lavfi -i mandelbrot=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $1 00_mandelbrot_tcode_ntsc.ogg

ffmpeg -i 00_mandelbrot_tcode_pal.ogg -vf lutrgb=g=0:b=0 00_mandelbrot_tcode_red_pal.ogg

ffmpeg -i 00_mandelbrot_tcode_pal.ogg -vf lutrgb=r=0:b=0 00_mandelbrot_tcode_green_pal.ogg

ffmpeg -i 00_mandelbrot_tcode_pal.ogg -vf lutrgb=r=0:g=0 00_mandelbrot_tcode_blue_pal.ogg

ffmpeg -i 00_mandelbrot_tcode_ntsc.ogg -vf lutrgb=g=0:b=0 00_mandelbrot_tcode_red_ntsc.ogg

ffmpeg -i 00_mandelbrot_tcode_ntsc.ogg -vf lutrgb=r=0:b=0 00_mandelbrot_tcode_green_ntsc.ogg

ffmpeg -i 00_mandelbrot_tcode_ntsc.ogg -vf lutrgb=r=0:g=0 00_mandelbrot_tcode_blue_ntsc.ogg

ffmpeg -f lavfi -i rgbtestsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 -frames:v $1 00_rgbtestsrc_tcode_pal.ogg

ffmpeg -f lavfi -i rgbtestsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $1 00_rgbtestsrc_tcode_ntsc.ogg

ffmpeg -f lavfi -i yuvtestsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 -frames:v $1 00_yuvtestsrc_tcode_pal.ogg

ffmpeg -f lavfi -i yuvtestsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $1 00_yuvtestsrc_tcode_ntsc.ogg

ffmpeg -f lavfi -i testsrc2=s=640x480:r=25 \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 -frames:v $1 00_testsrc2_tcode_pal.ogg

ffmpeg -f lavfi -i testsrc2=s=640x480:r=30000/1001 \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $1 00_testsrc2_tcode_ntsc.ogg

ffmpeg -i 00_testsrc2_tcode_pal.ogg -vf lutrgb=g=0:b=0 00_testsrc2_tcode_red_pal.ogg

ffmpeg -i 00_testsrc2_tcode_pal.ogg -vf lutrgb=r=0:b=0 00_testsrc2_tcode_green_pal.ogg

ffmpeg -i 00_testsrc2_tcode_pal.ogg -vf lutrgb=r=0:g=0 00_testsrc2_tcode_blue_pal.ogg

ffmpeg -i 00_testsrc2_tcode_ntsc.ogg -vf lutrgb=g=0:b=0 00_testsrc2_tcode_red_ntsc.ogg

ffmpeg -i 00_testsrc2_tcode_ntsc.ogg -vf lutrgb=r=0:b=0 00_testsrc2_tcode_green_ntsc.ogg

ffmpeg -i 00_testsrc2_tcode_ntsc.ogg -vf lutrgb=r=0:g=0 00_testsrc2_tcode_blue_ntsc.ogg

melt -profile dv_pal -group in=0 out=$1 \
  frei0r.test_pat_B 0=5 1=0 \
  -consumer avformat:00_temp_pal.dv

melt -profile dv_ntsc -group in=0 out=$1 \
  frei0r.test_pat_B 0=5 1=0 \
  -consumer avformat:00_temp_ntsc.dv

ffmpeg -i 00_temp_pal.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 00_pm5544_tcode_pal.ogg

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 00_pm5544_tcode_ntsc.ogg

rm 00_temp_pal.dv
rm 00_temp_ntsc.dv

melt -profile dv_pal -group in=0 out=$1 \
  frei0r.test_pat_B 0=6 1=0 \
  -consumer avformat:00_temp_pal.dv

melt -profile dv_ntsc -group in=0 out=$1 \
  frei0r.test_pat_B 0=6 1=0 \
  -consumer avformat:00_temp_ntsc.dv

ffmpeg -i 00_temp_pal.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 00_fubk_tcode_pal.ogg

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 00_fubk_tcode_ntsc.ogg

rm 00_temp_pal.dv
rm 00_temp_ntsc.dv

melt -profile dv_pal -group in=0 out=$1 \
  frei0r.test_pat_B 0=7 1=0 \
  -consumer avformat:00_temp_pal.dv

melt -profile dv_ntsc -group in=0 out=$1 \
  frei0r.test_pat_B 0=7 1=0 \
  -consumer avformat:00_temp_ntsc.dv

ffmpeg -i 00_temp_pal.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 00_simple_fubk_tcode_pal.ogg

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 00_simple_fubk_tcode_ntsc.ogg

rm 00_temp_pal.dv
rm 00_temp_ntsc.dv

melt -profile dv_pal -group in=0 out=$1 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_temp_pal.dv

melt -profile dv_ntsc -group in=0 out=$1 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_temp_ntsc.dv

ffmpeg -i 00_temp_pal.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 00_mlt_timecode_tcode_pal.ogg

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 00_mlt_timecode_tcode_ntsc.ogg

rm 00_temp_pal.dv
rm 00_temp_ntsc.dv

ffmpeg -f lavfi -i colorchart=patch_size=128x128:preset=reference \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 -frames:v $1 00_colorchart_ref_tcode_pal.ogg

ffmpeg -f lavfi -i colorchart=patch_size=128x128:preset=reference \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $1 00_colorchart_ref_tcode_ntsc.ogg

ffmpeg -f lavfi -i colorchart=patch_size=128x128:preset=skintones \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 -frames:v $1 00_colorchart_skin_tcode_pal.ogg

ffmpeg -f lavfi -i colorchart=patch_size=128x128:preset=skintones \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $1 00_colorchart_skin_tcode_ntsc.ogg

ffmpeg -f lavfi -i colorspectrum=s=640x480:type=all:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 -frames:v $1 00_colorspectrum_tcode_pal.ogg

ffmpeg -f lavfi -i colorspectrum=s=640x480:type=all:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $1 00_colorspectrum_tcode_ntsc.ogg

ffmpeg -f lavfi -i sierpinski=s=640x480:type=carpet:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 -frames:v $1 00_sierpinski_carpet_tcode_pal.ogg

ffmpeg -f lavfi -i sierpinski=s=640x480:type=carpet:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $1 00_sierpinski_carpet_tcode_ntsc.ogg

ffmpeg -f lavfi -i sierpinski=s=640x480:type=triangle:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 -frames:v $1 00_sierpinski_triangle_tcode_pal.ogg

ffmpeg -f lavfi -i sierpinski=s=640x480:type=triangle:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $1 00_sierpinski_triangle_tcode_ntsc.ogg

ffmpeg -f lavfi -i life=s=640x480:death_color=0x000000:life_color=0xFFFFFF:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 -frames:v $1 00_life_tcode_pal.ogg

ffmpeg -f lavfi -i life=s=640x480:death_color=0x000000:life_color=0xFFFFFF:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $1 00_life_tcode_ntsc.ogg

ffmpeg -f lavfi -i haldclutsrc=8 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x576 -r 25 -frames:v $1 00_haldclutsrc_tcode_pal.ogg

ffmpeg -f lavfi -i haldclutsrc=8 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec libvorbis -vcodec libtheora -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $1 00_haldclutsrc_tcode_ntsc.ogg

cd ../

