#!/bin/sh

# This script creates Matroska video files with SMPTE timecodes.
#
# Example usage:
#
# ./setup-mkv-film.sh dv 1000
# ./setup-mkv-film.sh dv50 1000
# ./setup-mkv-film.sh vcd 1000
# ./setup-mkv-film.sh svcd 1000
# ./setup-mkv-film.sh dvd 1000

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

mkdir 00_mkv_film_$1_$2
cd 00_mkv_film_$1_$2

ffmpeg -f lavfi -i smptebars=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-$1 -frames:v $2 00_smptebars_smpte_film.mkv

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-$1 -frames:v $2 00_smptehdbars_smpte_film.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-$1 -frames:v $2 00_testsrc_smpte_film.mkv

ffmpeg -i 00_testsrc_smpte_film.mkv -vf lutrgb=g=0:b=0 -target film-$1 00_testsrc_smpte_red_film.mkv

ffmpeg -i 00_testsrc_smpte_film.mkv -vf lutrgb=r=0:b=0 -target film-$1 00_testsrc_smpte_green_film.mkv

ffmpeg -i 00_testsrc_smpte_film.mkv -vf lutrgb=r=0:g=0 -target film-$1 00_testsrc_smpte_blue_film.mkv

ffmpeg -f lavfi -i mandelbrot=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-$1 -frames:v $2 00_mandelbrot_smpte_film.mkv

ffmpeg -i 00_mandelbrot_smpte_film.mkv -vf lutrgb=g=0:b=0 -target film-$1 00_mandelbrot_smpte_red_film.mkv

ffmpeg -i 00_mandelbrot_smpte_film.mkv -vf lutrgb=r=0:b=0 -target film-$1 00_mandelbrot_smpte_green_film.mkv

ffmpeg -i 00_mandelbrot_smpte_film.mkv -vf lutrgb=r=0:g=0 -target film-$1 00_mandelbrot_smpte_blue_film.mkv

melt -profile dv_ntsc -group in=0 out=$1 \
  frei0r.test_pat_B 0=5 1=0 \
  -consumer avformat:00_temp_ntsc.mkv

ffmpeg -i 00_temp_ntsc.mkv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-$1 -frames:v $2 00_pm5544_smpte_film.mkv

rm 00_temp_ntsc.mkv

melt -profile dv_ntsc -group in=0 out=$1 \
  frei0r.test_pat_B 0=6 1=0 \
  -consumer avformat:00_temp_ntsc.mkv

ffmpeg -i 00_temp_ntsc.mkv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-$1 -frames:v $2 00_fubk_smpte_film.mkv

rm 00_temp_ntsc.mkv

melt -profile dv_ntsc -group in=0 out=$1 \
  frei0r.test_pat_B 0=7 1=0 \
  -consumer avformat:00_temp_ntsc.mkv

ffmpeg -i 00_temp_ntsc.mkv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-$1 -frames:v $2 00_simple_fubk_smpte_film.mkv

rm 00_temp_ntsc.mkv

melt -profile dv_ntsc -group in=0 out=$1 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_temp_ntsc.mkv

ffmpeg -i 00_temp_ntsc.mkv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-$1 -frames:v $2 00_mlt_timecode_smpte_film.mkv

rm 00_temp_ntsc.mkv

ffmpeg -f lavfi -i rgbtestsrc=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-$1 -frames:v $2 00_rgbtestsrc_smpte_film.mkv

ffmpeg -f lavfi -i yuvtestsrc=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-$1 -frames:v $2 00_yuvtestsrc_smpte_film.mkv

ffmpeg -f lavfi -i testsrc2=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-$1 -frames:v $2 00_testsrc2_smpte_film.mkv

ffmpeg -i 00_testsrc2_smpte_film.mkv -vf lutrgb=g=0:b=0 -target film-$1 00_testsrc2_smpte_red_film.mkv

ffmpeg -i 00_testsrc2_smpte_film.mkv -vf lutrgb=r=0:b=0 -target film-$1 00_testsrc2_smpte_green_film.mkv

ffmpeg -i 00_testsrc2_smpte_film.mkv -vf lutrgb=r=0:g=0 -target film-$1 00_testsrc2_smpte_blue_film.mkv

ffmpeg -f lavfi -i colorchart=patch_size=128x128:preset=reference \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-$1 -frames:v $2 00_colorchart_ref_smpte_film.mkv

ffmpeg -f lavfi -i colorchart=patch_size=128x128:preset=skintones \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-$1 -frames:v $2 00_colorchart_skin_smpte_film.mkv

ffmpeg -f lavfi -i colorspectrum=s=640x480:type=all:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-$1 -frames:v $2 00_colorspectrum_smpte_film.mkv

ffmpeg -f lavfi -i sierpinski=s=640x480:type=carpet:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-$1 -frames:v $2 00_sierpinski_carpet_smpte_film.mkv

ffmpeg -f lavfi -i sierpinski=s=640x480:type=triangle:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-$1 -frames:v $2 00_sierpinski_triangle_smpte_film.mkv

ffmpeg -f lavfi -i life=s=640x480:death_color=0x000000:life_color=0xFFFFFF:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-$1 -frames:v $2 00_life_smpte_film.mkv

ffmpeg -f lavfi -i haldclutsrc=8 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-$1 -frames:v $2 00_haldclutsrc_smpte_film.mkv

cd ../

