rm ./*result.txt
rm -r ./result
mkdir ./result

cd ./lab-1/
sh test.sh

cd ../lab-1i/
sh test.sh

cd ../lab-1f_64/
sh test.sh

cd ../lab-1f_32/
sh test.sh

cd ../lab-1t/
sh test.sh

cd ..

mv ./*_result.txt ./result
