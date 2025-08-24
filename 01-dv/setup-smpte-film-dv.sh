#!/bin/sh

# This script creates FILM DV video files with SMPTE timecode.
#
# Example usage:
#
# ./setup-smpte-film-dv 1000

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

mkdir 00_smpte_film_dv_$1
cd 00_smpte_film_dv_$1

ffmpeg -f lavfi -i smptebars=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-dv -frames:v $1 00_smptebars_smpte_film.dv

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-dv -frames:v $1 00_smptehdbars_smpte_film.dv

ffmpeg -f lavfi -i testsrc=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-dv -frames:v $1 00_testsrc_smpte_film.dv

ffmpeg -i 00_testsrc_smpte_film.dv -vf lutrgb=g=0:b=0 -target film-dv 00_testsrc_smpte_red_film.dv

ffmpeg -i 00_testsrc_smpte_film.dv -vf lutrgb=r=0:b=0 -target film-dv 00_testsrc_smpte_green_film.dv

ffmpeg -i 00_testsrc_smpte_film.dv -vf lutrgb=r=0:g=0 -target film-dv 00_testsrc_smpte_blue_film.dv

ffmpeg -f lavfi -i mandelbrot=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-dv -frames:v $1 00_mandelbrot_smpte_film.dv

ffmpeg -i 00_mandelbrot_smpte_film.dv -vf lutrgb=g=0:b=0 -target film-dv 00_mandelbrot_smpte_red_film.dv

ffmpeg -i 00_mandelbrot_smpte_film.dv -vf lutrgb=r=0:b=0 -target film-dv 00_mandelbrot_smpte_green_film.dv

ffmpeg -i 00_mandelbrot_smpte_film.dv -vf lutrgb=r=0:g=0 -target film-dv 00_mandelbrot_smpte_blue_film.dv

ffmpeg -f lavfi -i rgbtestsrc=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-dv -frames:v $1 00_rgbtestsrc_smpte_film.dv

ffmpeg -f lavfi -i yuvtestsrc=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-dv -frames:v $1 00_yuvtestsrc_smpte_film.dv

ffmpeg -f lavfi -i testsrc2=s=640x480:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-dv -frames:v $1 00_testsrc2_smpte_film.dv

ffmpeg -f lavfi -i colorchart=patch_size=128x128:preset=reference \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-dv -frames:v $1 00_colorchart_ref_smpte_film.dv

ffmpeg -f lavfi -i colorchart=patch_size=128x128:preset=skintones \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-dv -frames:v $1 00_colorchart_skin_smpte_film.dv

ffmpeg -f lavfi -i colorspectrum=s=640x480:type=all:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-dv -frames:v $1 00_colorspectrum_smpte_film.dv

ffmpeg -f lavfi -i sierpinski=s=640x480:type=carpet:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-dv -frames:v $1 00_sierpinski_carpet_smpte_film.dv

ffmpeg -f lavfi -i sierpinski=s=640x480:type=triangle:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-dv -frames:v $1 00_sierpinski_triangle_smpte_film.dv

ffmpeg -f lavfi -i life=s=640x480:death_color=0x000000:life_color=0xFFFFFF:r=24000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-dv -frames:v $1 00_life_smpte_film.dv

ffmpeg -f lavfi -i haldclutsrc=8 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=24000/1001: box=1: boxcolor=0x000000@1" \
  -target film-dv -frames:v $1 00_haldclutsrc_smpte_film.dv

cd ../

