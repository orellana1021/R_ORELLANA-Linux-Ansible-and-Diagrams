!/bin/bash
echo "Hello! Let's find the dealer working!"
echo "Please enter the date (MMDD)."
read date
echo "Please enter the hour (XX:00:00)."
read hour
echo "AM or PM?"
read AM_PM
echo  "Please indicate what casino game."
echo "[1]BlackJack [2]Roulette [3]Texas Hold EM"
read num
filename=$date'_Dealer_schedule'
cat $filename | grep $hour > hours.txt
cat hours.txt | grep $AM_PM | awk -F '  ' '{print $1}'
a=1
b=2
c=3
if [ $num == $a ]
then
   cat hours.txt |grep $AM_PM | awk -F '        ' '{print $2}'
fi

if [ $num == $b ]
then
   cat hours.txt |grep $AM_PM | awk -F '        ' '{print $3}'
fi

if [ $num == $c ]
then
   cat hours.txt |grep $AM_PM | awk -F '        ' '{print $4}'
fi

rm hours.txt

exit

