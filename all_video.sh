LOOP=0
while true
do
	let LOOP++
	echo "///////////////////////////////////////////"
	echo "video Loop: $LOOP"
	echo "///////////////////////////////////////////"
	for video in $(ls | grep -v "*.sh")
	do
		echo "play $video"
		am start -n com.android.gallery3d/.app.MovieActivity -d "./$video"
	done
done
