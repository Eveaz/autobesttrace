#!/bin/bash

# apt -y install unzip

# install besttrace
if [ ! -f "besttrace" ]; then
	arch=$(uname -m)
    if [ "${arch}" == "i686" ]; then
    	wget -O besttrace https://github.com/Eveaz/autobesttrace/raw/main/besttrace32
    else
    	wget https://github.com/Eveaz/autobesttrace/raw/main/besttrace
    fi
    # unzip besttrace4linux.zip
    chmod +x besttrace
fi

## start to use besttrace

next() {
    printf "%-70s\n" "-" | sed 's/\s/-/g'
}

clear
next

ip_list=(14.215.116.1 101.95.120.109 117.28.254.129 113.207.25.138 119.6.6.6 211.138.180.2 183.221.253.100)
ip_addr=(广州电信 上海电信 厦门电信 重庆联通 成都联通 安徽移动 成都移动)
# ip_len=${#ip_list[@]}

for i in {0..7}
do
	echo ${ip_addr[$i]}
	./besttrace -q 1 ${ip_list[$i]}
	next
done