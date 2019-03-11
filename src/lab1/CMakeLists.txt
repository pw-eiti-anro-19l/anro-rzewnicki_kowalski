cmake_minimum_required(VERSION 2.8.3)
project(lab1)

find_package(catkin REQUIRED)

catkin_package()

catkin_install_python(PROGRAMS
  scripts/lab1.py
   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
