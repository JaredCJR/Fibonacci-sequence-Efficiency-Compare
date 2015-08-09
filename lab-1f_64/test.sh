rm -f result.txt
make clean
make fibseq

max=41
for i in `seq 3 $max`
do  
        yes $i | ./fibseq
	sleep 0.2
done

cp result.txt ../fast_doubling_64_result.txt
