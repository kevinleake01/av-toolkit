#!/bin/sh

# This script downloads Ogg Theora video files.

mkdir 00_samples
cd 00_samples

wget http://v2v.cc/~j/theora_testsuite/320x240.ogg
wget http://v2v.cc/~j/theora_testsuite/320x240.ogv
wget http://v2v.cc/~j/theora_testsuite/320x240.skeleton+cmml.ogv
wget http://v2v.cc/~j/theora_testsuite/pixel_aspect_ratio.ogg
wget http://v2v.cc/~j/theora_testsuite/videotestsrc-720x576-16-15.ogg
wget http://v2v.cc/~j/theora_testsuite/322x242_not-divisible-by-sixteen-framesize.ogg
wget http://v2v.cc/~j/theora_testsuite/chained_streams.ogg
wget http://v2v.cc/~j/theora_testsuite/multi2.ogg
wget http://v2v.cc/~j/theora_testsuite/mobile_itu601_i_422.ogg
wget http://v2v.cc/~j/theora_testsuite/ducks_take_off_444_720p25.ogg
wget http://v2v.cc/~j/theora_testsuite/stockholm-vfr.ogg
wget http://v2v.cc/~j/theora_testsuite/offset_test.ogv
wget http://v2v.cc/~j/theora_testsuite/sign_irene_cif-3qi-b.ogg
wget http://v2v.cc/~j/theora_testsuite/chroma_siting_test.ogv
wget http://v2v.cc/~j/theora_testsuite/0byteframes.ogv

cd ../

