#!/bin/sh

ffmpeg -f lavfi -i smptehdbars=s=2048x1536:r=1 \
  -frames:v 3 00_smptehdbars_3MP_%04d.png


