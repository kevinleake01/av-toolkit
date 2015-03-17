#!/bin/sh

# This program will create various audio sounds.


ffmpeg -f lavfi -i aevalsrc="sin(440*2*PI*t):s=8000:d=45" 01-test-0001.ogg

ffmpeg -f lavfi -i aevalsrc="sin(420*2*PI*t)|cos(430*2*PI*t):c=FC|BC:d=45" 01-test-0002.ogg

ffmpeg -f lavfi -i aevalsrc="-2+random(0):d=45" 01-test-0003.ogg

ffmpeg -f lavfi -i aevalsrc="0.1*sin(2*PI*(360-2.5/2)*t) | 0.1*sin(2*PI*(360+2.5/2)*t):d=45" 01-test-0004.ogg

ffmpeg -f lavfi -i "sine=f=220:b=4:d=45" 02-oggtest-0001.ogg

ffmpeg -f lavfi -i "sine=f=220:b=4:d=45" 02-wavtest-0001.wav

ffmpeg -f lavfi -i "sine=f=220:b=4:d=45" 02-opustest-0001.opus

