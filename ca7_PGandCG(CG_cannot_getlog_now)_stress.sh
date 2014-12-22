#Author：Issac Lin
#Ext: 7536
#version:1.1
#ca7_PGandCG(CG_cannot_getlog_now)_stress
#log_location:/data/ca7_PGandCG_stress.log
#
echo "ca7_PGandCG(CG_cannot_getlog_now)_stress version: 1.1"
if test -z $1
then
	echo "You must input a video"
else
	if test -z $2
	then
		echo "You must input the time of video in seconds"
	else
		echo 0xf > /sys/cpu_power_info/pg_state
		echo 'close a17 and open a7 : successful' 
		echo 'close a17 and open a7 : successful' >> /data/ca7_PGandCG_stress.log
		cat /proc/cpuinfo
		cat /proc/cpuinfo >> /data/ca7_PGandCG_stress.log
		while true
		do
			videoTime=10
			echo 'cpu_pg_times:'
			echo 'cpu_pg_times:' >> /data/ca7_PGandCG_stress.log
			cat /sys/cpu_power_info/ca7-0/cpu_pg_times
			cat /sys/cpu_power_info/ca7-1/cpu_pg_times
			cat /sys/cpu_power_info/ca7-2/cpu_pg_times
			cat /sys/cpu_power_info/ca7-3/cpu_pg_times
			cat /sys/cpu_power_info/ca7-0/cpu_pg_times >> /data/ca7_PGandCG_stress.log
			cat /sys/cpu_power_info/ca7-1/cpu_pg_times >> /data/ca7_PGandCG_stress.log
			cat /sys/cpu_power_info/ca7-2/cpu_pg_times >> /data/ca7_PGandCG_stress.log
			cat /sys/cpu_power_info/ca7-3/cpu_pg_times >> /data/ca7_PGandCG_stress.log
			sleep 10
			echo 'cpu_pg_times:'
			echo 'cpu_pg_times:' >> /data/ca7_PGandCG_stress.log
			cat /sys/cpu_power_info/ca7-0/cpu_pg_times
			cat /sys/cpu_power_info/ca7-1/cpu_pg_times
			cat /sys/cpu_power_info/ca7-2/cpu_pg_times
			cat /sys/cpu_power_info/ca7-3/cpu_pg_times
			cat /sys/cpu_power_info/ca7-0/cpu_pg_times >> /data/ca7_PGandCG_stress.log
			cat /sys/cpu_power_info/ca7-1/cpu_pg_times >> /data/ca7_PGandCG_stress.log
			cat /sys/cpu_power_info/ca7-2/cpu_pg_times >> /data/ca7_PGandCG_stress.log
			cat /sys/cpu_power_info/ca7-3/cpu_pg_times >> /data/ca7_PGandCG_stress.log
			sleep 10
			echo 'cpu_pg_times:'
			echo 'cpu_pg_times:' >> /data/ca7_PGandCG_stress.log
			cat /sys/cpu_power_info/ca7-0/cpu_pg_times
			cat /sys/cpu_power_info/ca7-1/cpu_pg_times
			cat /sys/cpu_power_info/ca7-2/cpu_pg_times
			cat /sys/cpu_power_info/ca7-3/cpu_pg_times
			cat /sys/cpu_power_info/ca7-0/cpu_pg_times >> /data/ca7_PGandCG_stress.log
			cat /sys/cpu_power_info/ca7-1/cpu_pg_times >> /data/ca7_PGandCG_stress.log
			cat /sys/cpu_power_info/ca7-2/cpu_pg_times >> /data/ca7_PGandCG_stress.log
			cat /sys/cpu_power_info/ca7-3/cpu_pg_times >> /data/ca7_PGandCG_stress.log
			sleep 10
			echo 'cpu_pg_times:'
			echo 'cpu_pg_times:' >> /data/ca7_PGandCG_stress.log
			cat /sys/cpu_power_info/ca7-0/cpu_pg_times
			cat /sys/cpu_power_info/ca7-1/cpu_pg_times
			cat /sys/cpu_power_info/ca7-2/cpu_pg_times
			cat /sys/cpu_power_info/ca7-3/cpu_pg_times
			cat /sys/cpu_power_info/ca7-0/cpu_pg_times >> /data/ca7_PGandCG_stress.log
			cat /sys/cpu_power_info/ca7-1/cpu_pg_times >> /data/ca7_PGandCG_stress.log
			cat /sys/cpu_power_info/ca7-2/cpu_pg_times >> /data/ca7_PGandCG_stress.log
			cat /sys/cpu_power_info/ca7-3/cpu_pg_times >> /data/ca7_PGandCG_stress.log
			#play video
			am start -n com.android.gallery3d/.app.MovieActivity -d "/sdcard/Movies/$1"
			echo 'start test content' 
			echo 'start test content' >> /data/ca7_PGandCG_stress.log
			while test videoTime -lt $2
			do
				sleep 10
				echo 'cpu_pg_times:'
				echo 'cpu_pg_times:' >> /data/ca7_PGandCG_stress.log
				cat /sys/cpu_power_info/ca7-0/cpu_pg_times
				cat /sys/cpu_power_info/ca7-1/cpu_pg_times
				cat /sys/cpu_power_info/ca7-2/cpu_pg_times
				cat /sys/cpu_power_info/ca7-3/cpu_pg_times
				cat /sys/cpu_power_info/ca7-0/cpu_pg_times >> /data/ca7_PGandCG_stress.log
				cat /sys/cpu_power_info/ca7-1/cpu_pg_times >> /data/ca7_PGandCG_stress.log
				cat /sys/cpu_power_info/ca7-2/cpu_pg_times >> /data/ca7_PGandCG_stress.log
				cat /sys/cpu_power_info/ca7-3/cpu_pg_times >> /data/ca7_PGandCG_stress.log
				let videoTime+=10
			done
			echo 'stop test content' 
			echo 'stop test content' >> /data/ca7_PGandCG_stress.log
		done
	fi
fi
