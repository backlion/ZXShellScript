case $1 in 
	1 ) echo 1;; 
	2 ) echo 2;; 
	3 ) echo 3;; 
	4 ) echo 4;; 
	5 ) echo 5;; 
	6 ) echo 7;; 
	* ) echo exit ;; 
esac

for i in $(seq 10);do echo $i;done
size=`ls -l CPFILE | awk '{total+=$4} END {print total}'`
echo "    1m13.41s real     0m1.48s user     0m0.89s system" | awk 'BEGIN {FS="m|s|\\."}{print $1*60*1000+$2*1000+$3}'

echo "    1m13.41s real     0m1.48s user     0m0.89s system" | awk 'BEGIN {FS="m|s|\\."}{print $1"_"$2"_"$3"_"$4}'

cp_time=`(time cp -rf CPFILE /data) 2>&1 | tee -a 1.txt | awk 'BEGIN {FS="m|\\."}{print $1*60+$2}'`

expr $(expr $size \* 1000) / 73041