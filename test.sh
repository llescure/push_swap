#!/bin/sh

#Set colors
BLACK="\033[0;30m"
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
PURPLE="\033[1;35m"
CYAN="\033[1;36m"
WHITE="\033[1;39m"
BOLD="\033[1m"

#Common cases of error management

echo "\n${CYAN}Error management"
echo "${BLUE}Test 1: ./push_swap one"
echo "${PURPLE}Result of push_swap:"
VAR=`./push_swap one`
echo "$VAR"
if [ $VAR = "Error" ]
then
	echo "${GREEN}SUCESS\n"
else
	echo "${RED}FAIL\n"
fi

echo "${BLUE}Test 2: ./push_swap 2 3 4 -3 2"
echo "${PURPLE}Result of push_swap:"
VAR=`./push_swap 2 3 4 -3 2`
echo "$VAR"
if [ $VAR = "Error" ]
then
	echo "${GREEN}SUCESS\n"
else
	echo "${RED}FAIL\n"
fi

echo "${BLUE}Test 3: ./push_swap 2 one 4"
echo "${PURPLE}Result of push_swap:"
VAR=`./push_swap 2 one 4`
echo "$VAR"
if [ $VAR = "Error" ]
then
	echo "${GREEN}SUCESS\n"
else
	echo "${RED}FAIL\n"
fi

echo "${BLUE}Test 4: ./push_swap 9 8 -2 --3"
echo "${PURPLE}Result of push_swap:"
VAR=`./push_swap 9 8 -2 --3`
echo "$VAR"
if [ $VAR = "Error" ]
then
	echo "${GREEN}SUCESS\n"
else
	echo "${RED}FAIL\n"
fi

echo "${BLUE}Test 5: ./push_swap"
echo "${PURPLE}Result of push_swap:"
VAR=`./push_swap`
echo "$VAR"
if [ -z "$VAR" ]
then
	echo "${GREEN}SUCESS\n"
else
	echo "${RED}FAIL\n"
fi

echo "${BLUE}Test 6: ./push_swap 2"
echo "${PURPLE}Result of push_swap:"
VAR=`./push_swap 2`
echo "$VAR"
if [ -z "$VAR" ]
then
	echo "${GREEN}SUCESS\n"
else
	echo "${RED}FAIL\n"
fi

echo "${BLUE}Test 7: ./push_swap -2147483649"
echo "${PURPLE}Result of push_swap:"
VAR=`./push_swap -2147483649`
echo "$VAR"
if [ $VAR = "Error" ]
then
	echo "${GREEN}SUCESS\n"
else
	echo "${RED}FAIL\n"
fi

echo "${BLUE}Test 8: ./push_swap 2147483649"
echo "${PURPLE}Result of push_swap:"
VAR=`./push_swap 2147483649`
echo "$VAR"
if [ $VAR = "Error" ]
then
	echo "${GREEN}SUCESS\n"
else
	echo "${RED}FAIL\n"
fi

echo "${BLUE}Test 9: ./push_swap -2147483649 1 18"
echo "${PURPLE}Result of push_swap:"
VAR=`./push_swap -2147483649 1 18`
echo "$VAR"
if [ $VAR = "Error" ]
then
	echo "${GREEN}SUCESS\n"
else
	echo "${RED}FAIL\n"
fi

echo "${BLUE}Test 10: ./push_swap 2147483649 23 10"
echo "${PURPLE}Result of push_swap:"
VAR=`./push_swap 2147483649 23 10`
echo "$VAR"
if [ $VAR = "Error" ]
then
	echo "${GREEN}SUCESS\n"
else
	echo "${RED}FAIL\n"
fi

echo "${BLUE}Test 11: ./push_swap 21474836496423739"
echo "${PURPLE}Result of push_swap:"
VAR=`./push_swap 21474836496423739`
echo "$VAR"
if [ $VAR = "Error" ]
then
	echo "${GREEN}SUCESS\n"
else
	echo "${RED}FAIL\n"
fi

echo "${BLUE}Test 12: ./push_swap 0 1 2 3"
echo "${PURPLE}Result of push_swap:"
VAR=`./push_swap 0 1 2 3`
echo "$VAR"
if [ -z "$VAR" ]
then
	echo "${GREEN}SUCESS\n"
else
	echo "${RED}FAIL\n"
fi

#Generating random tests

echo "${CYAN}\nRandom test"

read -p 'Enter number of test :' TESTN
read -p 'Enter interval with format [first number .. last_number] :' INTERVAL 
if [ -z $TESTN ] || [ -z $INTERVAL ]
then
	#Explain to the user what the tester is supposed to be given
	echo "\n"
	echo "${RED}number_of_test format integer"
	echo "${RED}interval_of_the test format [first_number .. last_number]"
else
	#Make a loop to generate tests
	for i in `seq 1 $TESTN`
	do
		ARG=`ruby -e "puts ($INTERVAL).to_a.shuffle.join(' ')"`
		echo "${BLUE}Test $i:"
		echo "${WHITE}$ARG"
		echo "${YELLOW}Number of operations:"
		./push_swap $ARG | wc -l
		echo "${PURPLE}Result of checker_linux:"
		VAR=`./push_swap $ARG | ./checker_linux $ARG`
		echo "$VAR"
		if [ $VAR = "OK" ]
		then
			echo "${GREEN}SUCESS\n"
		else
			echo "${RED}FAIL\n"
		fi
	done
fi
