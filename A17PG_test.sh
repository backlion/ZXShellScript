cat /sys/clk_util/ca17clk
cat /sys/clk_util/ca17clk >> /data/A17-0_single_core_100M_PG.log
echo 0 > /sys/devices/system/cpu/cpu0/online
echo 0 > /sys/devices/system/cpu/cpu1/online
echo 0 > /sys/devices/system/cpu/cpu2/online
echo 0 > /sys/devices/system/cpu/cpu3/online
cat /proc/cpuinfo
cat /proc/cpuinfo >> /data/A17-0_single_core_100M_PG.log
echo 0x10 > /sys/cpu_power_info/pg_state
while true
do 
	date
	date >> /data/A17-0_single_core_100M_PG.log
	cat /sys/cpu_power_info/cluster0_pg_times
	cat /sys/cpu_power_info/cluster0_pg_times >> /data/A17-0_single_core_100M_PG.log
	cat /sys/cpu_power_info/ca17-0/cpu_pg_times
	cat /sys/cpu_power_info/ca17-0/cpu_pg_times >> /data/A17-0_single_core_100M_PG.log
	sleep 10
done
