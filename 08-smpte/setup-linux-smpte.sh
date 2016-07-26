#!/bin/sh

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

ffmpeg -f lavfi -i smptebars=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 01-smptebars-0000.dv

ffmpeg -f lavfi -i smptebars=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 01-smptebars-0001.dv

ffmpeg -f lavfi -i smptebars=r=50 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=50: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 960x720 -r 50 -frames:v 1000 01-smptebars-0002.mkv

ffmpeg -f lavfi -i smptebars=r=60000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=60: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 960x720 -r 60000/1001 -frames:v 1000 01-smptebars-0003.mkv

ffmpeg -f lavfi -i smptebars=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 1440x1080 -r 25 -frames:v 1000 01-smptebars-0004.mkv

ffmpeg -f lavfi -i smptebars=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 1280x1080 -r 30000/1001 -frames:v 1000 01-smptebars-0005.mkv

ffmpeg -f lavfi -i smptehdbars=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 02-smptehdbars-0000.dv

ffmpeg -f lavfi -i smptehdbars=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 02-smptehdbars-0001.dv

ffmpeg -f lavfi -i smptehdbars=r=50 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=50: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 960x720 -r 50 -frames:v 1000 02-smptehdbars-0002.mkv

ffmpeg -f lavfi -i smptehdbars=r=60000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=60: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 960x720 -r 60000/1001 -frames:v 1000 02-smptehdbars-0003.mkv

ffmpeg -f lavfi -i smptehdbars=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 1440x1080 -r 25 -frames:v 1000 02-smptehdbars-0004.mkv

ffmpeg -f lavfi -i smptehdbars=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 1280x1080 -r 30000/1001 -frames:v 1000 02-smptehdbars-0005.mkv

ffmpeg -f lavfi -i testsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 03-testsrc-0000.dv

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 03-testsrc-0001.dv

ffmpeg -f lavfi -i testsrc=r=50 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=50: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 960x720 -r 50 -frames:v 1000 03-testsrc-0002.mkv

ffmpeg -f lavfi -i testsrc=r=60000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=60: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 960x720 -r 60000/1001 -frames:v 1000 03-testsrc-0003.mkv

ffmpeg -f lavfi -i testsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 1440x1080 -r 25 -frames:v 1000 03-testsrc-0004.mkv

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 1280x1080 -r 30000/1001 -frames:v 1000 03-testsrc-0005.mkv

ffmpeg -f lavfi -i mandelbrot=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 04-mandelbrot-0000.dv

ffmpeg -f lavfi -i mandelbrot=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 04-mandelbrot-0001.dv

ffmpeg -f lavfi -i mandelbrot=r=50 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=50: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 960x720 -r 50 -frames:v 1000 04-mandelbrot-0002.mkv

ffmpeg -f lavfi -i mandelbrot=r=60000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=60: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 960x720 -r 60000/1001 -frames:v 1000 04-mandelbrot-0003.mkv

ffmpeg -f lavfi -i mandelbrot=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 1440x1080 -r 25 -frames:v 1000 04-mandelbrot-0004.mkv

ffmpeg -f lavfi -i mandelbrot=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -pix_fmt yuv422p -s 1280x1080 -r 30000/1001 -frames:v 1000 04-mandelbrot-0005.mkv

melt -profile dv_pal -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:05-timecode-0000.dv

melt -profile dv_ntsc -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:05-timecode-0001.dv

ffmpeg -f lavfi -i smptebars=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv50 -frames:v 1000 06-dv50-0000.dv

ffmpeg -f lavfi -i smptebars=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv50 -frames:v 1000 06-dv50-0001.dv

ffmpeg -f lavfi -i smptehdbars=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv50 -frames:v 1000 06-dv50-0002.dv

ffmpeg -f lavfi -i smptehdbars=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv50 -frames:v 1000 06-dv50-0003.dv

ffmpeg -f lavfi -i testsrc=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv50 -frames:v 1000 06-dv50-0004.dv

ffmpeg -f lavfi -i testsrc=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv50 -frames:v 1000 06-dv50-0005.dv

ffmpeg -f lavfi -i mandelbrot=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv50 -frames:v 1000 06-dv50-0006.dv

ffmpeg -f lavfi -i mandelbrot=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv50 -frames:v 1000 06-dv50-0007.dv

melt -profile atsc_720p_25 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:07-atsc720p-0000.mkv

melt -profile atsc_720p_2997 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:07-atsc720p-0001.mkv

melt -profile atsc_720p_50 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:07-atsc720p-0002.mkv

melt -profile atsc_720p_5994 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:07-atsc720p-0003.mkv

melt -profile atsc_1080i_50 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:08-atsc1080i-0000.mkv

melt -profile atsc_1080i_5994 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:08-atsc1080i-0001.mkv

melt -profile atsc_1080p_25 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:09-atsc1080p-0000.mkv

melt -profile atsc_1080p_2997 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:09-atsc1080p-0001.mkv

melt -profile atsc_1080p_50 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:09-atsc1080p-0002.mkv

melt -profile atsc_1080p_5994 -group in=0 out=1000 \
  count direction=up style=timecode sound=frame0 \
  -consumer avformat:09-atsc1080p-0003.mkv

ffmpeg -f lavfi -i testsrc2=r=25 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\:00': r=25: box=1: boxcolor=0x000000@1" \
  -target pal-dv -frames:v 1000 10-testsrc2-0000.dv

ffmpeg -f lavfi -i testsrc2=r=30000/1001 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -target ntsc-dv -frames:v 1000 10-testsrc2-0001.dv

