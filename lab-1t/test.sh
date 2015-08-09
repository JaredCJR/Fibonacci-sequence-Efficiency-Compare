rm -f result.txt
make clean
make fibseq

max=41
for i in `seq 3 $max`
do  
        yes $i | ./fibseq
	sleep 0.2
done
mv ./result.txt ../tail_recursive_result.txt
