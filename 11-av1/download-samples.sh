#!/bin/sh

# This script downloads various AV1 test videos.

mkdir 00_samples
cd 00_samples

wget https://github.com/SPBTV/video_av1_samples/blob/master/spbtv_sample_bipbop_av1_960x540_25fps.mp4
wget https://test-videos.co.uk/vids/sintel/mp4/av1/1080/Sintel_1080_10s_10MB.mp4
wget https://test-videos.co.uk/vids/sintel/mp4/av1/720/Sintel_720_10s_10MB.mp4
wget https://test-videos.co.uk/vids/sintel/mp4/av1/360/Sintel_360_10s_5MB.mp4
wget https://dl6.webmfiles.org/BigBuckBunny-AV1.webm
wget https://dl6.webmfiles.org/BeachYoga-AV1.webm
wget https://dl6.webmfiles.org/BeachDrone-AV1.webm
wget https://www.elecard.com/storage/video/CityHall_1280x720.webm
wget https://insights.deovr.com/video/AV1/7779_1920p.mp4
wget https://repo.jellyfin.org/test-videos/SDR/AV1/Test%20Jellyfin%201080p%20AV1%2010bit%205M.mp4
wget https://woolyss.com/f/av1-opus-sita.webm
wget https://woolyss.com/f/av1-nosound-chimera.mp4
wget https://caraya.github.io/av1-video-demo/footloose.mp4
wget https://hitokageproduction.com/files/videoSamples/standard.mkv
wget http://download.opencontent.netflix.com.s3.amazonaws.com/AV1/Chimera/Chimera-2397fps-AV1-10bit-960x540-1658kbps.mp4
wget http://download.opencontent.netflix.com.s3.amazonaws.com/AV1/Sparks/Sparks-5994fps-AV1-10bit-1920x1080-2194kbps.mp4
wget http://download.opencontent.netflix.com.s3.amazonaws.com/AV1/DVB-DASH/A_1.mp4
wget http://download.opencontent.netflix.com.s3.amazonaws.com/AV1/DVB-DASH/A_2.mp4
wget http://download.opencontent.netflix.com.s3.amazonaws.com/AV1/DVB-DASH/B_1.mp4
wget http://download.opencontent.netflix.com.s3.amazonaws.com/AV1/DVB-DASH/B_2.mp4

cd ../

