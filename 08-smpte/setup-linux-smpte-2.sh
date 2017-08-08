#!/bin/sh

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

ffmpeg -f lavfi -i smptebars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 00_smptebars_smpte_pal.dv

ffmpeg -f lavfi -i smptebars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 00_smptebars_smpte_ntsc.dv

ffmpeg -f lavfi -i smptebars=s=640x480:r=50 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=50: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 960x720 -r 50 -frames:v 1000 00_smptebars_smpte_960x720r50.mkv

ffmpeg -f lavfi -i smptebars=s=640x480:r=60000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=60: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 960x720 -r 60000/1001 -frames:v 1000 00_smptebars_smpte_960x720r5994.mkv

ffmpeg -f lavfi -i smptebars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 1440x1080 -r 25 -frames:v 1000 00_smptebars_smpte_1440x1080r25.mkv

ffmpeg -f lavfi -i smptebars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 1280x1080 -r 30000/1001 -frames:v 1000 00_smptebars_smpte_1280x1080r2997.mkv

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 00_smptehdbars_smpte_pal.dv

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 00_smptehdbars_smpte_ntsc.dv

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=50 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=50: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 960x720 -r 50 -frames:v 1000 00_smptehdbars_smpte_960x720r50.mkv

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=60000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=60: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 960x720 -r 60000/1001 -frames:v 1000 00_smptehdbars_smpte_960x720r5994.mkv

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 1440x1080 -r 25 -frames:v 1000 00_smptehdbars_smpte_1440x1080r25.mkv

ffmpeg -f lavfi -i smptehdbars=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 1280x1080 -r 30000/1001 -frames:v 1000 00_smptehdbars_smpte_1280x1080r2997.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 00_testsrc_smpte_pal.dv

ffmpeg -f lavfi -i testsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 00_testsrc_smpte_ntsc.dv

ffmpeg -f lavfi -i testsrc=s=640x480:r=50 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=50: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 960x720 -r 50 -frames:v 1000 00_testsrc_smpte_960x720r50.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=60000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=60: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 960x720 -r 60000/1001 -frames:v 1000 00_testsrc_smpte_960x720r5994.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 1440x1080 -r 25 -frames:v 1000 00_testsrc_smpte_1440x1080r25.mkv

ffmpeg -f lavfi -i testsrc=s=640x480:r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 1280x1080 -r 30000/1001 -frames:v 1000 00_testsrc_smpte_1280x1080r2997.mkv


melt -profile dv_pal -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_mlt_timecode_smpte_pal.dv

melt -profile dv_ntsc -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_mlt_timecode_smpte_ntsc.dv

melt -profile atsc_720p_25 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_mlt_timecode_smpte_atsc720p25.mkv

melt -profile atsc_720p_2997 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_mlt_timecode_smpte_atsc720p2997.mkv

melt -profile atsc_720p_50 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_mlt_timecode_smpte_atsc720p50.mkv

melt -profile atsc_720p_5994 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_mlt_timecode_smpte_atsc720p5994.mkv

melt -profile atsc_1080i_50 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_mlt_timecode_smpte_atsc1080i50.mkv

melt -profile atsc_1080i_5994 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_mlt_timecode_smpte_atsc1080i5994.mkv

melt -profile atsc_1080p_25 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_mlt_timecode_smpte_1080p25.mkv

melt -profile atsc_1080p_2997 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_mlt_timecode_smpte_atsc1080p2997.mkv

melt -profile atsc_1080p_50 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_mlt_timecode_smpte_atsc1080p50.mkv

melt -profile atsc_1080p_5994 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:00_mlt_timecode_smpte_atsc1080p5994.mkv

