#!/bin/sh

# This script downloads various MXF files.

mkdir 00_samples
cd 00_samples

wget http://freemxf.org/samples/freeMXF-mxf1.mxf
wget http://freemxf.org/samples/freeMXF-mxf1a.mxf
wget http://freemxf.org/samples/freeMXF-mxf-dv-1.mxf
wget https://filesamples.com/samples/video/mxf/sample_1280x720_surfing_with_audio.mxf
wget https://filesamples.com/samples/video/mxf/sample_960x400_ocean_with_audio.mxf
wget https://filesamples.com/samples/video/mxf/sample_640x360.mxf
wget https://filesamples.com/samples/video/mxf/sample_960x540.mxf
wget https://filesamples.com/samples/video/mxf/sample_1280x720.mxf
wget https://filesamples.com/samples/video/mxf/sample_1920x1080.mxf
wget https://filesamples.com/samples/video/mxf/sample_2560x1440.mxf
wget https://filesamples.com/samples/video/mxf/sample_3840x2160.mxf

cd ../