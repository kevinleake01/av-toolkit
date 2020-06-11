#!/bin/sh

ffmpeg -f lavfi -i mandelbrot=s=2048x1536:r=1 \
  -frames:v 3 00_mandelbrot_3MP_%04d.png


