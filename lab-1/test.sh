rm -f result.txt
make clean
make fibseq

max=30
for i in `seq 3 $max`
do  
        yes $i | ./fibseq
	sleep 0.2
done
mv ./result.txt ../recursive_result.txt
