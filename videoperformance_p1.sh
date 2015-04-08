echo "///////////////////////////////////////////"
echo "video_performance_p1"
echo "///////////////////////////////////////////"

echo "///////////////////////////////////////////" >> video_performance_p1.log
echo "play H263_176x144_15fps_95.1Kbps_MP3_128Kbps_44.1KHz_ST_MPEG_44.1KHz_2chanels.mp4"
echo "play H263_176x144_15fps_95.1Kbps_MP3_128Kbps_44.1KHz_ST_MPEG_44.1KHz_2chanels.mp4" >> video_performance_p1.log
echo "///////////////////////////////////////////" >> video_performance_p1.log
am start -n com.android.gallery3d/.app.MovieActivity -d "/storage/extsdcard/H263_176x144_15fps_95.1Kbps_MP3_128Kbps_44.1KHz_ST_MPEG_44.1KHz_2chanels.mp4"
sleep 5
top -d 230 -m 10 -n 1 | tee -a video_performance_p1.log
sleep 10

echo "///////////////////////////////////////////" >> video_performance_p1.log
echo "play H263_352x288_518kbps_30fps_AMRNB_12.8kbps_8kHz_1chanel.3gp"
echo "play H263_352x288_518kbps_30fps_AMRNB_12.8kbps_8kHz_1chanel.3gp" >> video_performance_p1.log
echo "///////////////////////////////////////////" >> video_performance_p1.log
am start -n com.android.gallery3d/.app.MovieActivity -d "/storage/extsdcard/H263_352x288_518kbps_30fps_AMRNB_12.8kbps_8kHz_1chanel.3gp"
sleep 5
top -d 110 -m 10 -n 1 | tee -a video_performance_p1.log
sleep 10

echo "///////////////////////////////////////////" >> video_performance_p1.log
echo "play h263_H263_704x576_1.99Mbps_25fps.3gp"
echo "play h263_H263_704x576_1.99Mbps_25fps.3gp" >> video_performance_p1.log
echo "///////////////////////////////////////////" >> video_performance_p1.log
am start -n com.android.gallery3d/.app.MovieActivity -d "/storage/extsdcard/h263_H263_704x576_1.99Mbps_25fps.3gp"
sleep 5
top -d 160 -m 10 -n 1 | tee -a video_performance_p1.log
sleep 10

#H264
for video in $(ls /storage/extsdcard/H.264*)
do
	echo "///////////////////////////////////////////" >> video_performance_p1.log
	echo "play $video"
	echo "play $video" >> video_performance_p1.log
	echo "///////////////////////////////////////////" >> video_performance_p1.log
	am start -n com.android.gallery3d/.app.MovieActivity -d "/storage/extsdcard/$video"
	sleep 5
	top -d 72 -m 10 -n 1 | tee -a video_performance_p1.log
	sleep 10
done

#MPEG2
for video in $(ls /storage/extsdcard/MPEG2*)
do
	echo "///////////////////////////////////////////" >> video_performance_p1.log
	echo "play $video"
	echo "play $video" >> video_performance_p1.log
	echo "///////////////////////////////////////////" >> video_performance_p1.log
	am start -n com.android.gallery3d/.app.MovieActivity -d "/storage/extsdcard/$video"
	sleep 5
	top -d 72 -m 10 -n 1 | tee -a video_performance_p1.log
	sleep 10
done

#H265_720p
for video in $(ls /storage/extsdcard/ZXConvert_4K-Changhong*)
do
	echo "///////////////////////////////////////////" >> video_performance_p1.log
	echo "play $video"
	echo "play $video" >> video_performance_p1.log
	echo "///////////////////////////////////////////" >> video_performance_p1.log
	am start -n com.android.gallery3d/.app.MovieActivity -d "/storage/extsdcard/$video"
	sleep 5
	top -d 170 -m 10 -n 1 | tee -a video_performance_p1.log
	sleep 10
done

#H265_1080p
for video in $(ls /storage/extsdcard/ZXConvert_4K-HD*)
do
	echo "///////////////////////////////////////////" >> video_performance_p1.log
	echo "play $video"
	echo "play $video" >> video_performance_p1.log
	echo "///////////////////////////////////////////" >> video_performance_p1.log
	am start -n com.android.gallery3d/.app.MovieActivity -d "/storage/extsdcard/$video"
	sleep 5
	top -d 100 -m 10 -n 1 | tee -a video_performance_p1.log
	sleep 10
done