#! /bin/bash
mkdir -p ~/ros_ws/src
source /opt/ros/kinetic/setup.bash
cd ~/ros_ws
catkin_make
sudo apt-get update
sudo apt-get install git-core python-argparse python-wstool python-vcstools python-rosdep ros-kinetic-control-msgs ros-kinetic-joystick-drivers ros-kinetic-xacro ros-kinetic-tf2-ros ros-kinetic-rviz ros-kinetic-cv-bridge ros-kinetic-actionlib ros-kinetic-actionlib-msgs ros-kinetic-dynamic-reconfigure ros-kinetic-trajectory-msgs ros-kinetic-rospy-message-converter
cd ~/ros_ws/src
wstool init .
git clone https://github.com/RethinkRobotics/sawyer_robot.git
wstool merge sawyer_robot/sawyer_robot.rosinstall
wstool update
source /opt/ros/kinetic/setup.bash
cd ~/ros_ws
catkin_make
cd ~/ros_ws
cp ./src/intera_sdk/intera.sh ./intera.sh
ip1=$(hostname -I)
ip=$(echo ${ip1} | tr -dc '0,1,2,3,4,5,6,7,8,9,.')
sed -i 's/your_ip="192.168.XXX.XXX"/your_ip="'$ip'"/g' ./intera.sh
sed -i 's/robot_hostname="robot_hostname.local"/robot_hostname="021709CP00024.local"/g' ./intera.sh
sed -i 's/ros_version="indigo"/ros_version="kinetic"/g' ./intera.sh
