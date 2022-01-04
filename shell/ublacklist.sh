#!/bin/bash
cd shell/src

# Start Download
curl -o i1.txt https://raw.githubusercontent.com/jhchabran/code-search-blacklist/main/uBlacklist.txt
curl -o i2.txt https://raw.githubusercontent.com/sanketpatrikar/hn-search-blacklist/main/blacklist.txt
curl -o i3.txt https://raw.githubusercontent.com/rjaus/ublacklist-pinterest/main/ublacklist-pinterest.txt
curl -o i4.txt https://raw.githubusercontent.com/arosh/ublacklist-github-translation/master/uBlacklist.txt
curl -o i5.txt https://raw.githubusercontent.com/arosh/ublacklist-stackoverflow-translation/master/uBlacklist.txt
curl -o i6.txt https://raw.githubusercontent.com/rjaus/ublacklist-yelp/main/ublacklist-yelp.txt
curl -o i7.txt https://raw.githubusercontent.com/h-matsuo/uBlacklist-subscription-for-developer/master/list.txt

# Start Merge and Duplicate Removal
cat i*.txt > merge.txt
cat merge.txt | grep -v '#' | grep -v '##' | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' | grep -v '^\【' > temp.txt
sort temp.txt | uniq > tmp.txt
sort -n tmp.txt > tmmp.txt


# Start Count Rules
num=`cat tmmp.txt | wc -l`

# Start Add title and date
echo "# Version: `date +"%Y-%m-%d %H:%M:%S"`" >> tpdate.txt
echo "# Total count: $num" >> tpdate.txt
cat title.dd tpdate.txt tmmp.txt > final.txt

mv final.txt ../ublacklist.txt
rm *.txt
cd ../
exit

