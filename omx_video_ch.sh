path=$(pwd)
if test -z $1
then
	echo "You must input a video type"
else
	LOOP=0
	while true
	do 
		for video in *.$1
		 do
			let LOOP++
			echo "play $path/$video $LOOP times"
			am start -n com.android.gallery3d/.app.MovieActivity -d "$path/$video"
			if test -z $2
			then
				sleep 600
			else
				sleep $2
			fi
		done
	done
fi