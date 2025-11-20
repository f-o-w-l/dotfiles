#!/usr/bin/env bash
set -e

# ----- CONFIG -----
ROS_DISTRO=${ROS_DISTRO:-kilted}

echo "Installing ROS2: $ROS_DISTRO"

# ----- PREP -----
sudo apt update
sudo apt install -y software-properties-common curl gnupg lsb-release

# Add ROS2 repository
sudo apt install -y locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

sudo apt install -y curl
sudo curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
  -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] \
  http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | \
  sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update

# Install chosen ROS2 distro
sudo apt install -y ros-$ROS_DISTRO-desktop-full

# Vulkan / Mesa for RViz2
sudo apt install -y mesa-vulkan-drivers mesa-utils vulkan-tools

# ----- INIT ROSDEP -----
sudo apt install -y python3-rosdep build-essential python3-colcon-common-extensions
if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then
    sudo rosdep init
fi
sudo rosdep fix-permissions
sudo -u "$SUDO_USER" rosdep update

echo "ROS2 ($ROS_DISTRO) installation complete."
