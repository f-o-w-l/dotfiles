#!/usr/bin/env bash
set -e

# ----- CONFIG -----
ROS_DISTRO=${ROS_DISTRO:-noetic}

echo "Installing ROS1: $ROS_DISTRO"

# ----- PREP -----
sudo apt update
sudo apt install -y software-properties-common curl gnupg lsb-release

# Add ROS1 repository
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros1-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt update

# Install chosen ROS1 distro
sudo apt install -y ros-$ROS_DISTRO-desktop-full

# Vulkan / Mesa for RViz
sudo apt install -y mesa-vulkan-drivers mesa-utils vulkan-tools

# ----- INIT ROSDEP -----
sudo apt install -y python3-rosdep build-essential
if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then
    sudo rosdep init
fi
sudo rosdep fix-permissions
sudo -u "$SUDO_USER" rosdep update

echo "ROS1 ($ROS_DISTRO) installation complete."
