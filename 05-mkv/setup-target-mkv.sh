#!/bin/sh

# This script creates Matroska video files in PAL and NTSC with a timecode. Example usage:
#
# ./setup-target-mkv.sh dv 1000
# ./setup-target-mkv.sh dv50 1000
# ./setup-target-mkv.sh vcd 1000
# ./setup-target-mkv.sh svcd 1000
# ./setup-target-mkv.sh dvd 1000

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

mkdir 00_mkv_target_$1_$2
cd 00_mkv_target_$1_$2

ffmpeg -f lavfi -i smptebars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-$1 -frames:v $2 00_smptebars_tcode_pal.mkv

ffmpeg -f lavfi -i smptebars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-$1 -frames:v $2 00_smptebars_tcode_ntsc.mkv

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-$1 -frames:v $2 00_smptehdbars_tcode_pal.mkv

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-$1 -frames:v $2 00_smptehdbars_tcode_ntsc.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-$1 -frames:v $2 00_testsrc_tcode_pal.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-$1 -frames:v $2 00_testsrc_tcode_ntsc.mkv

ffmpeg -i 00_testsrc_tcode_pal.mkv -vf lutrgb=g=0:b=0 -target pal-$1 00_testsrc_tcode_red_pal.mkv

ffmpeg -i 00_testsrc_tcode_pal.mkv -vf lutrgb=r=0:b=0 -target pal-$1 00_testsrc_tcode_green_pal.mkv

ffmpeg -i 00_testsrc_tcode_pal.mkv -vf lutrgb=r=0:g=0 -target pal-$1 00_testsrc_tcode_blue_pal.mkv

ffmpeg -i 00_testsrc_tcode_ntsc.mkv -vf lutrgb=g=0:b=0 -target ntsc-$1 00_testsrc_tcode_red_ntsc.mkv

ffmpeg -i 00_testsrc_tcode_ntsc.mkv -vf lutrgb=r=0:b=0 -target ntsc-$1 00_testsrc_tcode_green_ntsc.mkv

ffmpeg -i 00_testsrc_tcode_ntsc.mkv -vf lutrgb=r=0:g=0 -target ntsc-$1 00_testsrc_tcode_blue_ntsc.mkv

ffmpeg -f lavfi -i mandelbrot=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-$1 -frames:v $2 00_mandelbrot_tcode_pal.mkv

ffmpeg -f lavfi -i mandelbrot=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-$1 -frames:v $2 00_mandelbrot_tcode_ntsc.mkv

ffmpeg -i 00_mandelbrot_tcode_pal.mkv -vf lutrgb=g=0:b=0 -target pal-$1 00_mandelbrot_tcode_red_pal.mkv

ffmpeg -i 00_mandelbrot_tcode_pal.mkv -vf lutrgb=r=0:b=0 -target pal-$1 00_mandelbrot_tcode_green_pal.mkv

ffmpeg -i 00_mandelbrot_tcode_pal.mkv -vf lutrgb=r=0:g=0 -target pal-$1 00_mandelbrot_tcode_blue_pal.mkv

ffmpeg -i 00_mandelbrot_tcode_ntsc.mkv -vf lutrgb=g=0:b=0 -target ntsc-$1 00_mandelbrot_tcode_red_ntsc.mkv

ffmpeg -i 00_mandelbrot_tcode_ntsc.mkv -vf lutrgb=r=0:b=0 -target ntsc-$1 00_mandelbrot_tcode_green_ntsc.mkv

ffmpeg -i 00_mandelbrot_tcode_ntsc.mkv -vf lutrgb=r=0:g=0 -target ntsc-$1 00_mandelbrot_tcode_blue_ntsc.mkv

ffmpeg -f lavfi -i rgbtestsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-$1 -frames:v $2 00_rgbtestsrc_tcode_pal.mkv

ffmpeg -f lavfi -i rgbtestsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-$1 -frames:v $2 00_rgbtestsrc_tcode_ntsc.mkv

ffmpeg -f lavfi -i yuvtestsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-$1 -frames:v $2 00_yuvtestsrc_tcode_pal.mkv

ffmpeg -f lavfi -i yuvtestsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-$1 -frames:v $2 00_yuvtestsrc_tcode_ntsc.mkv

ffmpeg -f lavfi -i testsrc2=s=640x480:r=25 \
  -target pal-$1 -frames:v $2 00_testsrc2_tcode_pal.mkv

ffmpeg -f lavfi -i testsrc2=s=640x480:r=30000/1001 \
  -target ntsc-$1 -frames:v $2 00_testsrc2_tcode_ntsc.mkv

ffmpeg -i 00_testsrc2_tcode_pal.mkv -vf lutrgb=g=0:b=0 -target pal-$1 00_testsrc2_tcode_red_pal.mkv

ffmpeg -i 00_testsrc2_tcode_pal.mkv -vf lutrgb=r=0:b=0 -target pal-$1 00_testsrc2_tcode_green_pal.mkv

ffmpeg -i 00_testsrc2_tcode_pal.mkv -vf lutrgb=r=0:g=0 -target pal-$1 00_testsrc2_tcode_blue_pal.mkv

ffmpeg -i 00_testsrc2_tcode_ntsc.mkv -vf lutrgb=g=0:b=0 -target ntsc-$1 00_testsrc2_tcode_red_ntsc.mkv

ffmpeg -i 00_testsrc2_tcode_ntsc.mkv -vf lutrgb=r=0:b=0 -target ntsc-$1 00_testsrc2_tcode_green_ntsc.mkv

ffmpeg -i 00_testsrc2_tcode_ntsc.mkv -vf lutrgb=r=0:g=0 -target ntsc-$1 00_testsrc2_tcode_blue_ntsc.mkv

melt -profile dv_pal -group in=0 out=$2 \
  frei0r.test_pat_B 0=5 1=0 \
  -consumer avformat:00_temp_pal.dv

melt -profile dv_ntsc -group in=0 out=$2 \
  frei0r.test_pat_B 0=5 1=0 \
  -consumer avformat:00_temp_ntsc.dv

ffmpeg -i 00_temp_pal.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-$1 00_pm5544_tcode_pal.mkv

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-$1 00_pm5544_tcode_ntsc.mkv

rm 00_temp_pal.dv
rm 00_temp_ntsc.dv

melt -profile dv_pal -group in=0 out=$2 \
  frei0r.test_pat_B 0=6 1=0 \
  -consumer avformat:00_temp_pal.dv

melt -profile dv_ntsc -group in=0 out=$2 \
  frei0r.test_pat_B 0=6 1=0 \
  -consumer avformat:00_temp_ntsc.dv

ffmpeg -i 00_temp_pal.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-$1 00_fubk_tcode_pal.mkv

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-$1 00_fubk_tcode_ntsc.mkv

rm 00_temp_pal.dv
rm 00_temp_ntsc.dv

melt -profile dv_pal -group in=0 out=$2 \
  frei0r.test_pat_B 0=7 1=0 \
  -consumer avformat:00_temp_pal.dv

melt -profile dv_ntsc -group in=0 out=$2 \
  frei0r.test_pat_B 0=7 1=0 \
  -consumer avformat:00_temp_ntsc.dv

ffmpeg -i 00_temp_pal.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-$1 00_simple_fubk_tcode_pal.mkv

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-$1 00_simple_fubk_tcode_ntsc.mkv

rm 00_temp_pal.dv
rm 00_temp_ntsc.dv

melt -profile dv_pal -group in=0 out=$2 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_temp_pal.dv

melt -profile dv_ntsc -group in=0 out=$2 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_temp_ntsc.dv

ffmpeg -i 00_temp_pal.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-$1 00_mlt_timecode_tcode_pal.mkv

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-$1 00_mlt_timecode_tcode_ntsc.mkv

rm 00_temp_pal.dv
rm 00_temp_ntsc.dv

ffmpeg -f lavfi -i colorchart=patch_size=128x128:preset=reference \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-$1 -frames:v $2 00_colorchart_ref_tcode_pal.mkv

ffmpeg -f lavfi -i colorchart=patch_size=128x128:preset=reference \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-$1 -frames:v $2 00_colorchart_ref_tcode_ntsc.mkv

ffmpeg -f lavfi -i colorchart=patch_size=128x128:preset=skintones \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-$1 -frames:v $2 00_colorchart_skin_tcode_pal.mkv

ffmpeg -f lavfi -i colorchart=patch_size=128x128:preset=skintones \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-$1 -frames:v $2 00_colorchart_skin_tcode_ntsc.mkv

ffmpeg -f lavfi -i colorspectrum=s=640x480:type=all:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-$1 -frames:v $2 00_colorspectrum_tcode_pal.mkv

ffmpeg -f lavfi -i colorspectrum=s=640x480:type=all:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-$1 -frames:v $2 00_colorspectrum_tcode_ntsc.mkv

ffmpeg -f lavfi -i sierpinski=s=640x480:type=carpet:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-$1 -frames:v $2 00_sierpinski_carpet_tcode_pal.mkv

ffmpeg -f lavfi -i sierpinski=s=640x480:type=carpet:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-$1 -frames:v $2 00_sierpinski_carpet_tcode_ntsc.mkv

ffmpeg -f lavfi -i sierpinski=s=640x480:type=triangle:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-$1 -frames:v $2 00_sierpinski_triangle_tcode_pal.mkv

ffmpeg -f lavfi -i sierpinski=s=640x480:type=triangle:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-$1 -frames:v $2 00_sierpinski_triangle_tcode_ntsc.mkv

ffmpeg -f lavfi -i life=s=640x480:death_color=0x000000:life_color=0xFFFFFF:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-$1 -frames:v $2 00_life_tcode_pal.mkv

ffmpeg -f lavfi -i life=s=640x480:death_color=0x000000:life_color=0xFFFFFF:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-$1 -frames:v $2 00_life_tcode_ntsc.mkv

ffmpeg -f lavfi -i haldclutsrc=8 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-$1 -frames:v $2 00_haldclutsrc_tcode_pal.mkv

ffmpeg -f lavfi -i haldclutsrc=8 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-$1 -frames:v $2 00_haldclutsrc_tcode_ntsc.mkv

cd ../

