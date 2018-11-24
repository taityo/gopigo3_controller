# ros master setup script
# $0:master hostname $1:master ip adress
# $2:node hostname   $3:node ip adress

# ros network
~/.bashrc << export ROS_MASTER_URI=http://$1:11311
~/.bashrc << export ROS_IP=$3
~/.bashrc << export ROS_HOSTNAME=$2
~/.bashrc << export ROSLAUNCH_SSH_UNKNOWN=1
source ~/.bashrc

# hostname
/etc/hosts << $2 $3

# ntp server
ntpdate ntp.nict.jp

# package install
cd ..

# gopigo3 driver install
git clone https://github.com/ros-gopigo/gopigo3_node.git

# ydlidar driver install
git clone https://github.com/EAIBOT/ydlidar.git
cd ydlidar/startup
chmod 777 ./*
sh initenv.sh 

# package build
roscd
cd ..
catkin_make

