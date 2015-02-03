#Author：Issac Lin
#Ext: 7536
#version:1.0
#antutu_stress
#log_filename:antutu_stress.log
#

echo "antutu_stress version: 1.1"
echo "antutu_stress version: 1.1"  >> antutu_stress.log
LOOP=0
if test -e antutu_stress.log
then
	rm antutu_stress.log
fi
am start -n com.antutu.ABenchMark/.ABenchMarkStart
echo "start antutu benchmark"
sleep 10
while true
do
	let LOOP++
	date
	date >> antutu_stress.log
	echo "run antutu Benchmark $LOOP time"
	echo "run antutu Benchmark $LOOP time" >> antutu_stress.log
	am start -n com.antutu.ABenchMark/com.antutu.benchmark.activity.ScoreBenchActivity
	sleep 300
done
 