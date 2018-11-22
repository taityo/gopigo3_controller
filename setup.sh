# ros master setup script
# $0:master hostname $1:master ip adress
# $2:node hostname   $3:node ip adress

# ros network
~/.bashrc << ROS_MASTER_URI=http://$1:11311
~/.bashrc << ROS_IP=$3
~/.bashrc << ROS_HOSTNAME=$2
source ~/.bashrc

# hostname
/etc/hosts << $2 $3

# ntp server

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

