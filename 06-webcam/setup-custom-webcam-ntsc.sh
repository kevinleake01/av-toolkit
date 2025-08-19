#!/bin/sh

# This script creates Matroska video files from a webcam using customized audio
# and video codecs. Example usage:
#
# ./setup-custom-webcam-ntsc.sh 640x480 10 libvorbis libtheora 1000
# ./setup-custom-webcam-ntsc.sh 640x480 10 libopus libvp9 1000
# ./setup-custom-webcam-ntsc.sh 640x480 10 libopus libaom-av1 1000

FONTFILE=/usr/share/fonts/TTF/VeraMono.ttf

mkdir 00_custom_$1_$2_$3_$4_$5_ntsc
cd 00_custom_$1_$2_$3_$4_$5_ntsc

ffmpeg -f v4l2 -s $1 -r $2 -i /dev/video0 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{pts\:hms}-----%{n}': box=1: boxcolor=0x000000@1" \
  -acodec $3 -vcodec $4 -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $5 00_webcam_tcode.mkv

ffmpeg -f v4l2 -s $1 -r $2 -i /dev/video0 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='': timecode='00\:00\:00\;00': r=30: box=1: boxcolor=0x000000@1" \
  -acodec $3 -vcodec $4 -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $5 00_webcam_smpte.mkv

ffmpeg -f v4l2 -s $1 -r $2 -i /dev/video0 \
  -vf "drawtext=fontfile=$FONTFILE: \
  fontsize=25: fontcolor=0xFFFFFF: text='%{gmtime} UTC': box=1: boxcolor=0x000000@1" \
  -acodec $3 -vcodec $4 -b:v 1000k -s 720x480 -r 30000/1001 -frames:v $5 00_webcam_utc.mkv

cd ../

