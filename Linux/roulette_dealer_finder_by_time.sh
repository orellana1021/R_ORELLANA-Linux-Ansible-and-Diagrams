#!/bin/bash
echo "Hello! Let's find the Roulette Dealer working!"
echo "Please enter the date (MMDD)."
read date
echo "Please enter the hour (XX:00:00)."
read hour
echo "AM or PM"
read AM_PM
filename=$date'_Dealer_schedule'
cat $filename | grep $hour > hours.txt
cat hours.txt | grep $AM_PM | awk -F '  ' '{print $1, $3}'
rm hours.txt
exit

