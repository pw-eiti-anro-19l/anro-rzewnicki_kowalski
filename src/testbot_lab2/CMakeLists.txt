cmake_minimum_required(VERSION 2.8.3)
project(testbot_lab2)

find_package(catkin REQUIRED COMPONENTS
  rospy
  sensor_msgs
  std_msgs
  tf
  urdf
)

#find_package(orocos_kdl REQUIRED)
catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES testbot_lab2
#  CATKIN_DEPENDS kdl rospy sensor_msgs std_msgs tf
#  DEPENDS system_lib
)

include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)


