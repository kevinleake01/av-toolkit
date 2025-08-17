#!/bin/sh

# This program will create various audio sounds.


ffmpeg -f lavfi \
  -i aevalsrc="0.125*sin(2*PI*220.00*t) | 0.125*sin(2*PI*227.83*t):d=45" 01-vorbis-0001.ogg

ffmpeg -f lavfi \
  -i aevalsrc="0.125*sin(2*PI*220.00*t) | 0.125*sin(2*PI*227.83*t):d=45" 02-opus-0001.opus

ffmpeg -f lavfi \
  -i aevalsrc="sin(420*2*PI*t) | cos(430*2*PI*t):d=45" 01-vorbis-0002.ogg

ffmpeg -f lavfi \
  -i aevalsrc="sin(420*2*PI*t) | cos(430*2*PI*t):d=45" 02-opus-0002.opus

ffmpeg -f lavfi \
  -i aevalsrc="sin(10*2*PI*t)*sin(880*2*PI*t):d=45" 01-vorbis-0003.ogg

ffmpeg -f lavfi \
  -i aevalsrc="sin(10*2*PI*t)*sin(880*2*PI*t):d=45" 02-opus-0003.opus

ffmpeg -f lavfi \
  -i aevalsrc="0.1*sin(2*PI*(360-2.5/2)*t) | 0.1*sin(2*PI*(360+2.5/2)*t):d=45" 01-vorbis-0004.ogg

ffmpeg -f lavfi \
  -i aevalsrc="0.1*sin(2*PI*(360-2.5/2)*t) | 0.1*sin(2*PI*(360+2.5/2)*t):d=45" 02-opus-0004.opus

ffmpeg -f lavfi \
  -i aevalsrc="-2+random(0) | -2+random(0):d=45" 01-vorbis-0005.ogg

ffmpeg -f lavfi \
  -i aevalsrc="-2+random(0) | -2+random(0):d=45" 02-opus-0005.opus

ffmpeg -f lavfi \
  -i "sine=f=500:d=45[a];sine=f=1000:d=45[b];[a][b]amerge=inputs=2" 01-vorbis-0006.ogg

ffmpeg -f lavfi \
  -i "sine=f=500:d=45[a];sine=f=1000:d=45[b];[a][b]amerge=inputs=2" 02-opus-0006.opus

ffmpeg -f lavfi \
  -i "sine=f=220:b=4:d=45[a];sine=f=220:b=4:d=45[b];[a][b]amerge=inputs=2" 01-vorbis-0007.ogg

ffmpeg -f lavfi \
  -i "sine=f=220:b=4:d=45[a];sine=f=220:b=4:d=45[b];[a][b]amerge=inputs=2" 02-opus-0007.opus

ffmpeg -f lavfi \
  -i "sine=f=235:b=2:d=45[a];sine=f=238:b=3:d=45[b];[a][b]amerge=inputs=2" 01-vorbis-0008.ogg

ffmpeg -f lavfi \
  -i "sine=f=235:b=2:d=45[a];sine=f=238:b=3:d=45[b];[a][b]amerge=inputs=2" 02-opus-0008.opus

ffmpeg -f lavfi \
  -i "sine=f=265:b=5:d=45[a];sine=f=268:b=6:d=45[b];[a][b]amerge=inputs=2" 01-vorbis-0009.ogg

ffmpeg -f lavfi \
  -i "sine=f=265:b=5:d=45[a];sine=f=268:b=6:d=45[b];[a][b]amerge=inputs=2" 02-opus-0009.opus

