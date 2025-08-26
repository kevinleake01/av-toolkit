#!/bin/sh

# This script creates MPEG video files in FILM-SVCD with a timecode. Example usage:
#
# ./setup-svcd-film.sh 1000

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

mkdir 00_mpeg_film_svcd_$1
cd 00_mpeg_film_svcd_$1

ffmpeg -f lavfi -i smptebars=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target film-svcd -frames:v $1 00_smptebars_tcode_film.mpg

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target film-svcd -frames:v $1 00_smptehdbars_tcode_film.mpg

ffmpeg -f lavfi -i testsrc=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target film-svcd -frames:v $1 00_testsrc_tcode_film.mpg

ffmpeg -i 00_testsrc_tcode_film.mpg -vf lutrgb=g=0:b=0 -target film-svcd 00_testsrc_tcode_red_film.mpg

ffmpeg -i 00_testsrc_tcode_film.mpg -vf lutrgb=r=0:b=0 -target film-svcd 00_testsrc_tcode_green_film.mpg

ffmpeg -i 00_testsrc_tcode_film.mpg -vf lutrgb=r=0:g=0 -target film-svcd 00_testsrc_tcode_blue_film.mpg

ffmpeg -f lavfi -i mandelbrot=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target film-svcd -frames:v $1 00_mandelbrot_tcode_film.mpg

ffmpeg -i 00_mandelbrot_tcode_film.mpg -vf lutrgb=g=0:b=0 -target film-svcd 00_mandelbrot_tcode_red_film.mpg

ffmpeg -i 00_mandelbrot_tcode_film.mpg -vf lutrgb=r=0:b=0 -target film-svcd 00_mandelbrot_tcode_green_film.mpg

ffmpeg -i 00_mandelbrot_tcode_film.mpg -vf lutrgb=r=0:g=0 -target film-svcd 00_mandelbrot_tcode_blue_film.mpg

ffmpeg -f lavfi -i rgbtestsrc=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target film-svcd -frames:v $1 00_rgbtestsrc_tcode_film.mpg

ffmpeg -f lavfi -i yuvtestsrc=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target film-svcd -frames:v $1 00_yuvtestsrc_tcode_film.mpg

ffmpeg -f lavfi -i testsrc2=s=640x480:r=24000/1001 \
  -target film-svcd -frames:v $1 00_testsrc2_tcode_film.mpg

ffmpeg -i 00_testsrc2_tcode_film.mpg -vf lutrgb=g=0:b=0 -target film-svcd 00_testsrc2_tcode_red_film.mpg

ffmpeg -i 00_testsrc2_tcode_film.mpg -vf lutrgb=r=0:b=0 -target film-svcd 00_testsrc2_tcode_green_film.mpg

ffmpeg -i 00_testsrc2_tcode_film.mpg -vf lutrgb=r=0:g=0 -target film-svcd 00_testsrc2_tcode_blue_film.mpg

melt -profile dv_ntsc -group in=0 out=$1 \
  frei0r.test_pat_B 0=5 1=0 \
  -consumer avformat:00_temp_ntsc.dv

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target film-svcd 00_pm5544_tcode_film.mpg

rm 00_temp_ntsc.dv

melt -profile dv_ntsc -group in=0 out=$1 \
  frei0r.test_pat_B 0=6 1=0 \
  -consumer avformat:00_temp_ntsc.dv

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target film-svcd 00_fubk_tcode_film.mpg

rm 00_temp_ntsc.dv

melt -profile dv_ntsc -group in=0 out=$1 \
  frei0r.test_pat_B 0=7 1=0 \
  -consumer avformat:00_temp_ntsc.dv

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target film-svcd 00_simple_fubk_tcode_film.mpg

rm 00_temp_ntsc.dv

melt -profile dv_ntsc -group in=0 out=$1 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_temp_ntsc.dv

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target film-svcd 00_mlt_timecode_tcode_film.mpg

rm 00_temp_ntsc.dv

ffmpeg -f lavfi -i colorchart=patch_size=128x128:preset=reference \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target film-svcd -frames:v $1 00_colorchart_ref_tcode_film.mpg

ffmpeg -f lavfi -i colorchart=patch_size=128x128:preset=skintones \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target film-svcd -frames:v $1 00_colorchart_skin_tcode_film.mpg

ffmpeg -f lavfi -i colorspectrum=s=640x480:type=all:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target film-svcd -frames:v $1 00_colorspectrum_tcode_film.mpg

ffmpeg -f lavfi -i sierpinski=s=640x480:type=carpet:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target film-svcd -frames:v $1 00_sierpinski_carpet_tcode_film.mpg

ffmpeg -f lavfi -i sierpinski=s=640x480:type=triangle:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target film-svcd -frames:v $1 00_sierpinski_triangle_tcode_film.mpg

ffmpeg -f lavfi -i life=s=640x480:death_color=0x000000:life_color=0xFFFFFF:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target film-svcd -frames:v $1 00_life_tcode_film.mpg

ffmpeg -f lavfi -i haldclutsrc=8 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target film-svcd -frames:v $1 00_haldclutsrc_tcode_film.mpg

cd ../

