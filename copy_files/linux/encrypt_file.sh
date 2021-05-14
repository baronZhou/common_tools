#!/bin/bash

type_de=$1
input=$2
output=$3

head_padding="header.img"
tail_padding="tail.img"
temp_img="temp.img"

secret_key="0123456789012345012345678901234501234567890123450123456789012345"

function decimal_sub()
{
	local a=$1
	local b=$2
	local result
	let "result=a-b"
	echo $result
}

if [[ $type_de == "e" ]];then
	openssl enc -e -aes-256-ecb -K $secret_key -in $input -out $temp_img
	cat $head_padding $temp_img $tail_padding > $output
	rm $temp_img
	echo "Has encrypted $input to $output."
elif [[ $type_de == "d" ]];then
	input_len=$(ls $input -l | awk '{print $5}')
	input_len=$(decimal_sub $input_len 2336)
	dd if=$input of=$temp_img bs=1 count=$input_len skip=2080
	openssl enc -d -aes-256-ecb -K $secret_key -in $temp_img -out $output
	rm $temp_img
	echo "Has decrypted $input to $output."
else
	echo "[$0] The paramaters are error!"
fi
