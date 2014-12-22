#Author：Issac Lin
#Ext: 7536
#version:1.2
#ca7ca17_dvfs_stress
#log_location:/data/ca7ca17_dvfs_stress.log
#
echo "ca7ca17_dvfs_stress version: 1.2"
if test -z $1
then
	echo "You must input a video"
else
	if test -z $2
	then
		echo "You must input the time of video in seconds"
	else
		echo '/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq set to 1400000' 
		echo '/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq set to 1800000' 
		echo 1400000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
		echo 1800000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
		echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
		echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
		while true
		do
			videoTime=10
			echo 'clk_util:'
			echo 'clk_util:' >> /data/ca7ca17_dvfs_stress.log
			cat /sys/clk_util/ca7clk
			cat /sys/clk_util/ca17clk
			cat /sys/clk_util/ca7clk >> /data/ca7ca17_dvfs_stress.log
			cat /sys/clk_util/ca17clk >> /data/ca7ca17_dvfs_stress.log
			sleep 10
			echo 'clk_util:'
			echo 'clk_util:' >> /data/ca7ca17_dvfs_stress.log
			cat /sys/clk_util/ca7clk
			cat /sys/clk_util/ca17clk
			cat /sys/clk_util/ca7clk >> /data/ca7ca17_dvfs_stress.log
			cat /sys/clk_util/ca17clk >> /data/ca7ca17_dvfs_stress.log
			sleep 10
			echo 'clk_util:'
			echo 'clk_util:' >> /data/ca7ca17_dvfs_stress.log
			cat /sys/clk_util/ca7clk
			cat /sys/clk_util/ca17clk
			cat /sys/clk_util/ca7clk >> /data/ca7ca17_dvfs_stress.log
			cat /sys/clk_util/ca17clk >> /data/ca7ca17_dvfs_stress.log
			sleep 10
			echo 'clk_util:'
			echo 'clk_util:' >> /data/ca7ca17_dvfs_stress.log
			cat /sys/clk_util/ca7clk
			cat /sys/clk_util/ca17clk
			cat /sys/clk_util/ca7clk >> /data/ca7ca17_dvfs_stress.log
			cat /sys/clk_util/ca17clk >> /data/ca7ca17_dvfs_stress.log
			#play video
			am start -n com.android.gallery3d/.app.MovieActivity -d "/sdcard/Movies/$1"
			echo 'start test content' 
			echo 'start test content' >> /data/ca7ca17_dvfs_stress.log
			while test videoTime -lt $2
			do
				sleep 10
				echo 'clk_util:'
				echo 'clk_util:' >> /data/ca7ca17_dvfs_stress.log
				cat /sys/clk_util/ca7clk
				cat /sys/clk_util/ca17clk
				cat /sys/clk_util/ca7clk >> /data/ca7ca17_dvfs_stress.log
				cat /sys/clk_util/ca17clk >> /data/ca7ca17_dvfs_stress.log
				let videoTime+=10
			done
			echo 'stop test content' 
			echo 'stop test content' >> /data/ca7ca17_dvfs_stress.log
		done
	fi
fi
