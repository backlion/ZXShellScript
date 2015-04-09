function memoryTest(){
	while true
	do
		dumpsys meminfo mediaserver | tee -a video_performance_p2.log
		sleep 10
	done
}
# echo "///////////////////////////////////////////"
# echo "video_performance_p2"
# echo "///////////////////////////////////////////"

# echo "///////////////////////////////////////////" >> video_performance_p2.log
# echo "play Hisense.1080p.AVS.MP2.ts"
# echo "play Hisense.1080p.AVS.MP2.ts" >> video_performance_p2.log
# echo "///////////////////////////////////////////" >> video_performance_p2.log
# am start -n com.android.gallery3d/.app.MovieActivity -d "/storage/extsdcard/Hisense.1080p.AVS.MP2.ts"
# sleep 5
# top -d 540 -m 10 -n 1 | tee -a video_performance_p2.log
# sleep 60

# echo "///////////////////////////////////////////" >> video_performance_p2.log
# echo "play Hitachi.1080p.AVS.MP2.ts"
# echo "play Hitachi.1080p.AVS.MP2.ts" >> video_performance_p2.log
# echo "///////////////////////////////////////////" >> video_performance_p2.log
# am start -n com.android.gallery3d/.app.MovieActivity -d "/storage/extsdcard/Hitachi.1080p.AVS.MP2.ts"
# sleep 5
# top -d 540 -m 10 -n 1 | tee -a video_performance_p2.log
# sleep 60

# echo "///////////////////////////////////////////" >> video_performance_p2.log
# echo "play Panasonic.1080p.AVS.MP2.ts"
# echo "play Panasonic.1080p.AVS.MP2.ts" >> video_performance_p2.log
# echo "///////////////////////////////////////////" >> video_performance_p2.log
# am start -n com.android.gallery3d/.app.MovieActivity -d "/storage/extsdcard/Panasonic.1080p.AVS.MP2.ts"
# sleep 5
# top -d 240 -m 10 -n 1 | tee -a video_performance_p2.log
# sleep 60

# echo "///////////////////////////////////////////" >> video_performance_p2.log
# echo "play Panasonic.1080p.AVS.MP2.ts"
# echo "play Panasonic.1080p.AVS.MP2.ts" >> video_performance_p2.log
# echo "///////////////////////////////////////////" >> video_performance_p2.log
# am start -n com.android.gallery3d/.app.MovieActivity -d "/storage/extsdcard/Panasonic.1080p.AVS.MP2.ts"
# sleep 5
# top -d 240 -m 10 -n 1 | tee -a video_performance_p2.log
# sleep 60

# echo MPEG4
# for video in $(ls /storage/extsdcard/MPEG4*)
# do
	# echo "///////////////////////////////////////////" >> video_performance_p2.log
	# echo "play $video"
	# echo "play $video" >> video_performance_p2.log
	# echo "///////////////////////////////////////////" >> video_performance_p2.log
	# am start -n com.android.gallery3d/.app.MovieActivity -d "$video"
	# sleep 5
	# top -d 140 -m 10 -n 1 | tee -a video_performance_p2.log
	# sleep 20
# done

# echo VP8
# for video in $(ls /storage/extsdcard/VP8*)
# do
	# echo "///////////////////////////////////////////" >> video_performance_p2.log
	# echo "play $video"
	# echo "play $video" >> video_performance_p2.log
	# echo "///////////////////////////////////////////" >> video_performance_p2.log
	# am start -n com.android.gallery3d/.app.MovieActivity -d "$video"
	# sleep 5
	# top -d 140 -m 10 -n 1 | tee -a video_performance_p2.log
	# sleep 20
# done

# echo 4K
# for video in $(ls /storage/extsdcard/ZXConvert_4K*)
# do
	# echo "///////////////////////////////////////////" >> video_performance_p2.log
	# echo "play $video"
	# echo "play $video" >> video_performance_p2.log
	# echo "///////////////////////////////////////////" >> video_performance_p2.log
	# am start -n com.android.gallery3d/.app.MovieActivity -d "$video"
	# sleep 5
	# top -d 165 -m 10 -n 1 | tee -a video_performance_p2.log
	# sleep 20
# done

# echo VC1
# for video in $(ls /storage/extsdcard/ZXConvert_VC1*)
# do
	# echo "///////////////////////////////////////////" >> video_performance_p2.log
	# echo "play $video"
	# echo "play $video" >> video_performance_p2.log
	# echo "///////////////////////////////////////////" >> video_performance_p2.log
	# am start -n com.android.gallery3d/.app.MovieActivity -d "$video"
	# sleep 5
	# top -d 140 -m 10 -n 1 | tee -a video_performance_p2.log
	# sleep 20
# done

# echo WMV
# for video in $(ls /storage/extsdcard/ZXConvert_WMV*)
# do
	# echo "///////////////////////////////////////////" >> video_performance_p2.log
	# echo "play $video"
	# echo "play $video" >> video_performance_p2.log
	# echo "///////////////////////////////////////////" >> video_performance_p2.log
	# am start -n com.android.gallery3d/.app.MovieActivity -d "$video"
	# sleep 5
	# top -d 140 -m 10 -n 1 | tee -a video_performance_p2.log
	# sleep 20
# done

echo memory_test
memoryTest &
for video in $(ls /storage/extsdcard/memory_test/*)
do
	echo "///////////////////////////////////////////" >> video_performance_p2.log
	echo "play $video"
	echo "play $video" >> video_performance_p2.log
	echo "///////////////////////////////////////////" >> video_performance_p2.log
	am start -n com.android.gallery3d/.app.MovieActivity -d "$video"
	sleep 300
done
