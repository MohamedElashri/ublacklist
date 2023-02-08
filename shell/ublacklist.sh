#!/bin/bash
cd shell/src


# Loop over links.txt file which contain all the links to curl instead of hardcoding them
# and keep the sources.txt file without removal of the links


 while read line; do
    curl -o i$counter.txt $line
    counter=$((counter+1))
    echo $counter
    echo $line
    echo " "
  done < sources.txt
 echo "Done"

# Start Merge and Duplicate Removal
cat i*.txt | sort | uniq > temp.txt
mv temp.txt i1.txt
cat i1.txt | grep -v '#' | grep -v '##' | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' | grep -v '^\【' > temp.txt
sort temp.txt | uniq > tmp.txt
sort -n tmp.txt > tmmp.txt


# Start Count Rules
num=`cat tmmp.txt | wc -l`

# Start Add title and date
echo "# Version: `date +"%Y-%m-%d %H:%M:%S"`" >> tpdate.txt
echo "# Total count: $num" >> tpdate.txt
cat title.dd tpdate.txt tmmp.txt > final.txt

mv final.txt ../ublacklist.txt
rm !(sources.txt) *.txt
cd ../
exit
