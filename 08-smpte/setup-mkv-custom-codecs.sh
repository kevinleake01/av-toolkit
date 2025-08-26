#!/bin/sh

# This script creates Matroska video files with SMPTE timecodes using customized audio
# and video codecs. Example usage:
#
# ./setup-mkv-custom-codecs.sh libvorbis libtheora 1000
# ./setup-mkv-custom-codecs.sh libopus vp9 1000
# ./setup-mkv-custom-codecs.sh libopus libaom-av1 1000

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

mkdir 00_custom_$1_$2_$3
cd 00_custom_$1_$2_$3

ffmpeg -f lavfi -i smptebars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x576 -r 25 -frames:v $3 00_smptebars_smpte_pal.mkv

ffmpeg -f lavfi -i smptebars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $3 00_smptebars_smpte_ntsc.mkv

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x576 -r 25 -frames:v $3 00_smptehdbars_smpte_pal.mkv

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $3 00_smptehdbars_smpte_ntsc.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x576 -r 25 -frames:v $3 00_testsrc_smpte_pal.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $3 00_testsrc_smpte_ntsc.mkv

ffmpeg -i 00_testsrc_smpte_pal.mkv -vf lutrgb=g=0:b=0 00_testsrc_smpte_red_pal.mkv

ffmpeg -i 00_testsrc_smpte_pal.mkv -vf lutrgb=r=0:b=0 00_testsrc_smpte_green_pal.mkv

ffmpeg -i 00_testsrc_smpte_pal.mkv -vf lutrgb=r=0:g=0 00_testsrc_smpte_blue_pal.mkv

ffmpeg -i 00_testsrc_smpte_ntsc.mkv -vf lutrgb=g=0:b=0 00_testsrc_smpte_red_ntsc.mkv

ffmpeg -i 00_testsrc_smpte_ntsc.mkv -vf lutrgb=r=0:b=0 00_testsrc_smpte_green_ntsc.mkv

ffmpeg -i 00_testsrc_smpte_ntsc.mkv -vf lutrgb=r=0:g=0 00_testsrc_smpte_blue_ntsc.mkv

ffmpeg -f lavfi -i mandelbrot=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x576 -r 25 -frames:v $3 00_mandelbrot_smpte_pal.mkv

ffmpeg -f lavfi -i mandelbrot=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $3 00_mandelbrot_smpte_ntsc.mkv

ffmpeg -i 00_mandelbrot_smpte_pal.mkv -vf lutrgb=g=0:b=0 00_mandelbrot_smpte_red_pal.mkv

ffmpeg -i 00_mandelbrot_smpte_pal.mkv -vf lutrgb=r=0:b=0 00_mandelbrot_smpte_green_pal.mkv

ffmpeg -i 00_mandelbrot_smpte_pal.mkv -vf lutrgb=r=0:g=0 00_mandelbrot_smpte_blue_pal.mkv

ffmpeg -i 00_mandelbrot_smpte_ntsc.mkv -vf lutrgb=g=0:b=0 00_mandelbrot_smpte_red_ntsc.mkv

ffmpeg -i 00_mandelbrot_smpte_ntsc.mkv -vf lutrgb=r=0:b=0 00_mandelbrot_smpte_green_ntsc.mkv

ffmpeg -i 00_mandelbrot_smpte_ntsc.mkv -vf lutrgb=r=0:g=0 00_mandelbrot_smpte_blue_ntsc.mkv

ffmpeg -f lavfi -i rgbtestsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x576 -r 25 -frames:v $3 00_rgbtestsrc_smpte_pal.mkv

ffmpeg -f lavfi -i rgbtestsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $3 00_rgbtestsrc_smpte_ntsc.mkv

ffmpeg -f lavfi -i yuvtestsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x576 -r 25 -frames:v $3 00_yuvtestsrc_smpte_pal.mkv

ffmpeg -f lavfi -i yuvtestsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $3 00_yuvtestsrc_smpte_ntsc.mkv

ffmpeg -f lavfi -i testsrc2=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x576 -r 25 -frames:v $3 00_testsrc2_smpte_pal.mkv

ffmpeg -f lavfi -i testsrc2=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $3 00_testsrc2_smpte_ntsc.mkv

ffmpeg -i 00_testsrc2_smpte_pal.mkv -vf lutrgb=g=0:b=0 00_testsrc2_smpte_red_pal.mkv

ffmpeg -i 00_testsrc2_smpte_pal.mkv -vf lutrgb=r=0:b=0 00_testsrc2_smpte_green_pal.mkv

ffmpeg -i 00_testsrc2_smpte_pal.mkv -vf lutrgb=r=0:g=0 00_testsrc2_smpte_blue_pal.mkv

ffmpeg -i 00_testsrc2_smpte_ntsc.mkv -vf lutrgb=g=0:b=0 00_testsrc2_smpte_red_ntsc.mkv

ffmpeg -i 00_testsrc2_smpte_ntsc.mkv -vf lutrgb=r=0:b=0 00_testsrc2_smpte_green_ntsc.mkv

ffmpeg -i 00_testsrc2_smpte_ntsc.mkv -vf lutrgb=r=0:g=0 00_testsrc2_smpte_blue_ntsc.mkv

melt -profile dv_pal -group in=0 out=$3 \
  frei0r.test_pat_B 0=5 1=0 \
  -consumer avformat:00_temp_pal.dv

melt -profile dv_ntsc -group in=0 out=$3 \
  frei0r.test_pat_B 0=5 1=0 \
  -consumer avformat:00_temp_ntsc.dv

ffmpeg -i 00_temp_pal.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x576 -r 25 00_pm5544_smpte_pal.mkv

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x480 -r 30000/1001 00_pm5544_smpte_ntsc.mkv

rm 00_temp_pal.dv
rm 00_temp_ntsc.dv

melt -profile dv_pal -group in=0 out=$3 \
  frei0r.test_pat_B 0=6 1=0 \
  -consumer avformat:00_temp_pal.dv

melt -profile dv_ntsc -group in=0 out=$3 \
  frei0r.test_pat_B 0=6 1=0 \
  -consumer avformat:00_temp_ntsc.dv

ffmpeg -i 00_temp_pal.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x576 -r 25 00_fubk_smpte_pal.mkv

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x480 -r 30000/1001 00_fubk_smpte_ntsc.mkv

rm 00_temp_pal.dv
rm 00_temp_ntsc.dv

melt -profile dv_pal -group in=0 out=$3 \
  frei0r.test_pat_B 0=7 1=0 \
  -consumer avformat:00_temp_pal.dv

melt -profile dv_ntsc -group in=0 out=$3 \
  frei0r.test_pat_B 0=7 1=0 \
  -consumer avformat:00_temp_ntsc.dv

ffmpeg -i 00_temp_pal.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x576 -r 25 00_simple_fubk_smpte_pal.mkv

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x480 -r 30000/1001 00_simple_fubk_smpte_ntsc.mkv

rm 00_temp_pal.dv
rm 00_temp_ntsc.dv

melt -profile dv_pal -group in=0 out=$3 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_temp_pal.dv

melt -profile dv_ntsc -group in=0 out=$3 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_temp_ntsc.dv

ffmpeg -i 00_temp_pal.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x576 -r 25 00_mlt_timecode_smpte_pal.mkv

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x480 -r 30000/1001 00_mlt_timecode_smpte_ntsc.mkv

rm 00_temp_pal.dv
rm 00_temp_ntsc.dv

ffmpeg -f lavfi -i colorchart=patch_size=128x128:preset=reference \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x576 -r 25 -frames:v $3 00_colorchart_ref_smpte_pal.mkv

ffmpeg -f lavfi -i colorchart=patch_size=128x128:preset=reference \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $3 00_colorchart_ref_smpte_ntsc.mkv

ffmpeg -f lavfi -i colorchart=patch_size=128x128:preset=skintones \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x576 -r 25 -frames:v $3 00_colorchart_skin_smpte_pal.mkv

ffmpeg -f lavfi -i colorchart=patch_size=128x128:preset=skintones \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $3 00_colorchart_skin_smpte_ntsc.mkv

ffmpeg -f lavfi -i colorspectrum=s=640x480:type=all:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x576 -r 25 -frames:v $3 00_colorspectrum_smpte_pal.mkv

ffmpeg -f lavfi -i colorspectrum=s=640x480:type=all:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $3 00_colorspectrum_smpte_ntsc.mkv

ffmpeg -f lavfi -i sierpinski=s=640x480:type=carpet:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x576 -r 25 -frames:v $3 00_sierpinski_carpet_smpte_pal.mkv

ffmpeg -f lavfi -i sierpinski=s=640x480:type=carpet:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $3 00_sierpinski_carpet_smpte_ntsc.mkv

ffmpeg -f lavfi -i sierpinski=s=640x480:type=triangle:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x576 -r 25 -frames:v $3 00_sierpinski_triangle_smpte_pal.mkv

ffmpeg -f lavfi -i sierpinski=s=640x480:type=triangle:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $3 00_sierpinski_triangle_smpte_ntsc.mkv

ffmpeg -f lavfi -i life=s=640x480:death_color=0x000000:life_color=0xFFFFFF:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x576 -r 25 -frames:v $3 00_life_smpte_pal.mkv

ffmpeg -f lavfi -i life=s=640x480:death_color=0x000000:life_color=0xFFFFFF:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $3 00_life_smpte_ntsc.mkv

ffmpeg -f lavfi -i haldclutsrc=8 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x576 -r 25 -frames:v $3 00_haldclutsrc_smpte_pal.mkv

ffmpeg -f lavfi -i haldclutsrc=8 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $1 -vcodec $2 -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $3 00_haldclutsrc_smpte_ntsc.mkv

cd ../

