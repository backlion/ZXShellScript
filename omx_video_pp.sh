path=$(pwd)
if test -z $1
then
	echo "You must input a video"
else
	#video=$1
	LOOP=0
	while true
	do 
		let LOOP++
		#echo "play $path/$video $LOOP times"
		#am start -n com.android.gallery3d/.app.MovieActivity -d "$path/$video"
		echo "play $path/$1 $LOOP times"
		am start -n com.android.gallery3d/.app.MovieActivity -d "$path/$1"
		if test -z $2
		then
			sleep 600
		else
			sleep $2
		fi
	done
fi