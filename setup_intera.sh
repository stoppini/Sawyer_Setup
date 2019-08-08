#! /bin/bash
cd ~/ros_ws
cp ./src/intera_sdk/intera.sh ./intera.sh
ip1=$(hostname -I)
ip=$(echo ${ip1} | tr -dc '0,1,2,3,4,5,6,7,8,9,.')
sed -i 's/your_ip="192.168.XXX.XXX"/your_ip="'$ip'"/g' ./intera.sh
sed -i 's/robot_hostname="robot_hostname.local"/robot_hostname="021709CP00024.local"/g' ./intera.sh
sed -i 's/ros_version="indigo"/ros_version="kinetic"/g' ./intera.sh
