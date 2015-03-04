#path=$(pwd)
#5880上sdcard为虚拟路径，原路径mnt系统权限无法访问
if test -z $1
then
	echo "You must input a video"
else
	if test -e omx_video_5880.log
	then
		rm omx_video_5880.log
	fi
	echo "omx_video_5880 version: 1.1"
	echo "omx_video_5880 version: 1.1"  >> omx_video_5880.log
	if test -z $2
	then
		echo "set script sleep time 600 seconds"  >> omx_video_5880.log
	else
		echo "set script sleep time $2 seconds"  >> omx_video_5880.log
	fi
	#video=$1
	LOOP=0
	while true
	do 
		let LOOP++
		#echo "play $path/$video $LOOP times"
		#am start -n com.android.gallery3d/.app.MovieActivity -d "$path/$video"
		echo "play $1 $LOOP times"
		echo "play $1 $LOOP times" >> omx_video_5880.log
		am start -n com.android.gallery3d/.app.MovieActivity -d "/sdcard/Movies/$1"
		if test -z $2
		then
			sleep 600
		else
			sleep $2
		fi
	done
fi