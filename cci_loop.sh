#Author：Issac Lin
#Ext: 7536
#version:1.1
#cci_loop
#cci_loop.log
#

echo "cci_loop version: 1.1"
while true
do
	date
	count=0
	while test $count -lt 1000
	do
		let count++
		echo cci > /sys/clk_util/clks
	done
	sleep 3600
done
 