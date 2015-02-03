#Author：Issac Lin
#Ext: 7536
#version:1.0
#cci_loop
#cci_loop.log
#

echo "cci_loop version: 1.0"
echo "cci_loop version: 1.0"  >> cci_loop.log
if test -e cci_loop.log
then
	rm cci_loop.log
fi
if test -z $1
then
	sleep_time=30
else
	sleep_time=$1
fi
while true
do
	date
	date >> cci_loop.log
	echo cci > /sys/clk_util/clks
	echo cci > /sys/clk_util/clks >> cci_loop.log
	sleep $sleep_time
done
 