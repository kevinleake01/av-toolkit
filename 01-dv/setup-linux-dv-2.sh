#!/bin/sh

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

ffmpeg -f lavfi -i smptebars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 00_smptebars_tcode_pal.dv

ffmpeg -f lavfi -i smptebars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 00_smptebars_tcode_ntsc.dv

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 00_smptehdbars_tcode_pal.dv

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 00_smptehdbars_tcode_ntsc.dv

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 00_testsrc_tcode_pal.dv

ffmpeg -f lavfi -i testsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 00_testsrc_tcode_ntsc.dv

ffmpeg -f lavfi -i rgbtestsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 00_rgbtestsrc_tcode_pal.dv

ffmpeg -f lavfi -i rgbtestsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 00_rgbtestsrc_tcode_ntsc.dv

ffmpeg -f lavfi -i yuvtestsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 00_yuvtestsrc_tcode_pal.dv

ffmpeg -f lavfi -i yuvtestsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 00_yuvtestsrc_tcode_ntsc.dv

ffmpeg -f lavfi -i mandelbrot=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 00_mandelbrot_tcode_pal.dv

ffmpeg -f lavfi -i mandelbrot=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 00_mandelbrot_tcode_ntsc.dv

ffmpeg -f lavfi -i testsrc2=s=640x480:r=25 \
  -target pal-dv -frames:v 1000 00_testsrc2_tcode_pal.dv

ffmpeg -f lavfi -i testsrc2=s=640x480:r=30000/1001 \
  -target ntsc-dv -frames:v 1000 00_testsrc2_tcode_ntsc.dv

ffmpeg -f lavfi -i smptebars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 00_smptebars_smpte_pal.dv

ffmpeg -f lavfi -i smptebars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 00_smptebars_smpte_ntsc.dv

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 00_smptehdbars_smpte_pal.dv

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 00_smptehdbars_smpte_ntsc.dv

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 00_testsrc_smpte_pal.dv

ffmpeg -f lavfi -i testsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 00_testsrc_smpte_ntsc.dv

ffmpeg -f lavfi -i rgbtestsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 00_rgbtestsrc_smpte_pal.dv

ffmpeg -f lavfi -i rgbtestsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 00_rgbtestsrc_smpte_ntsc.dv

ffmpeg -f lavfi -i yuvtestsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 00_yuvtestsrc_smpte_pal.dv

ffmpeg -f lavfi -i yuvtestsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 00_yuvtestsrc_smpte_ntsc.dv

ffmpeg -f lavfi -i testsrc2=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 00_testsrc2_smpte_pal.dv

ffmpeg -f lavfi -i testsrc2=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 00_testsrc2_smpte_ntsc.dv

melt -profile dv_pal -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_mlt_timecode_smpte_pal.dv

melt -profile dv_ntsc -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_mlt_timecode_smpte_ntsc.dv

melt -profile dv_pal -group in=0 out=1000 \
  frei0r.test_pat_B 0=5 1=0 \
  -consumer avformat:00_temp_pal.dv

melt -profile dv_ntsc -group in=0 out=1000 \
  frei0r.test_pat_B 0=5 1=0 \
  -consumer avformat:00_temp_ntsc.dv

ffmpeg -i 00_temp_pal.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dv 00_pm5544_tcode_pal.dv

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-dv 00_pm5544_tcode_ntsc.dv

ffmpeg -i 00_temp_pal.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv 00_pm5544_smpte_pal.dv

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv 00_pm5544_smpte_ntsc.dv

rm 00_temp_pal.dv
rm 00_temp_ntsc.dv

melt -profile dv_pal -group in=0 out=1000 \
  frei0r.test_pat_B 0=6 1=0 \
  -consumer avformat:00_temp_pal.dv

melt -profile dv_ntsc -group in=0 out=1000 \
  frei0r.test_pat_B 0=6 1=0 \
  -consumer avformat:00_temp_ntsc.dv

ffmpeg -i 00_temp_pal.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target pal-dv 00_fubk_tcode_pal.dv

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -target ntsc-dv 00_fubk_tcode_ntsc.dv

ffmpeg -i 00_temp_pal.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv 00_fubk_smpte_pal.dv

ffmpeg -i 00_temp_ntsc.dv \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv 00_fubk_smpte_ntsc.dv

rm 00_temp_pal.dv
rm 00_temp_ntsc.dv

