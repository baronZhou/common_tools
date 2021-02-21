#!/bin/bash

src_dir=$1
dst_dir=$2

echo "$0 enter"
echo "It will decrypt $src_dir to $dst_dir"

function generate_copied_files()
{
	local l_src_dir=$1
	local l_dst_dir=$2

	local cur_dir=`pwd`
	local file_list
	local filename
	local filedir
	local result
	local tail_char

	tail_char=$(echo ${l_src_dir:0-1:1})
	if [[ $tail_char == "/" ]];then
		l_src_dir=$(echo ${l_src_dir%?})
	fi

	tail_char=$(echo ${l_dst_dir:0-1:1})
	if [[ $tail_char == "/" ]];then
		l_dst_dir=$(echo ${l_dst_dir%?})
	fi

	if [ ! -d $l_dst_dir ];then
		mkdir -p $l_dst_dir
	fi

	cd $l_src_dir
	file_list=$(find ./ -type f)
	cd $cur_dir

	for filename in $file_list;
	do
		filename=`echo ${filename:2:1000}`
		
		result=$(echo $filename | grep "/")
		if [[ "$result" != "" ]];then
			filedir=$(echo ${filename%/*})
			mkdir -p $l_dst_dir"/"$filedir
		fi
		touch $l_dst_dir"/"$filename
		echo "cat $l_src_dir/$filename > $l_dst_dir/$filename"
		cat $l_src_dir"/"$filename > $l_dst_dir"/"$filename
	done	
}

if [ ! -e $src ];then
	echo "The $src_dir is not exist. Exit!"
fi

if [ -f $src_dir ];then
	echo "The $src_dir is file!"
	cat $src_dir > $dst_dir
	exit
fi

echo "The $src_dir is dir !"
generate_copied_files $src_dir $dst_dir