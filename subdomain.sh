#! /bin/bash
day=$(date +%A)
touch urls.txt 
echo -e "welcome $USER! Today is $day.\nYor are using $SHELL for script \n \nAuthor:ANAND MOHAN A M"
echo "enter the DOMAIN:-"$1
assetfinder $1 | httprobe >http.txt
cp http.txt temp_subs.txt

while read urls ; do
     echo  ${urls#*//} >>urls.txt 
  done  < temp_subs.txt
    
sort -u urls.txt > sorted_subs.txt
FILE="sorted_subs.txt"

count=$(cat sorted_subs.txt |wc -l)
rm urls.txt
rm temp_subs.txt
echo -e "\n"
echo "script execution completed"
echo "total ${count} subdomains found"

echo "--------------------------------"
echo "| ******** sorted list ********|"
echo "--------------------------------"
cat $FILE
rm -r http.txt
rm -r sorted_subs.txt
