# Install script for directory: /home/przewnic/Documents/ANRO/anro-rzewnicki_kowalski/src/testbot_lab2

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/przewnic/Documents/ANRO/anro-rzewnicki_kowalski/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/testbot_lab2/srv" TYPE FILE FILES
    "/home/przewnic/Documents/ANRO/anro-rzewnicki_kowalski/src/testbot_lab2/srv/myjint.srv"
    "/home/przewnic/Documents/ANRO/anro-rzewnicki_kowalski/src/testbot_lab2/srv/myoint.srv"
    "/home/przewnic/Documents/ANRO/anro-rzewnicki_kowalski/src/testbot_lab2/srv/jint_control_srv.srv"
    "/home/przewnic/Documents/ANRO/anro-rzewnicki_kowalski/src/testbot_lab2/srv/oint_control_srv.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/testbot_lab2/cmake" TYPE FILE FILES "/home/przewnic/Documents/ANRO/anro-rzewnicki_kowalski/build/testbot_lab2/catkin_generated/installspace/testbot_lab2-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/przewnic/Documents/ANRO/anro-rzewnicki_kowalski/devel/include/testbot_lab2")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/przewnic/Documents/ANRO/anro-rzewnicki_kowalski/devel/share/roseus/ros/testbot_lab2")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/przewnic/Documents/ANRO/anro-rzewnicki_kowalski/devel/share/common-lisp/ros/testbot_lab2")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/przewnic/Documents/ANRO/anro-rzewnicki_kowalski/devel/share/gennodejs/ros/testbot_lab2")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/przewnic/Documents/ANRO/anro-rzewnicki_kowalski/devel/lib/python2.7/dist-packages/testbot_lab2")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/przewnic/Documents/ANRO/anro-rzewnicki_kowalski/devel/lib/python2.7/dist-packages/testbot_lab2")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/przewnic/Documents/ANRO/anro-rzewnicki_kowalski/build/testbot_lab2/catkin_generated/installspace/testbot_lab2.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/testbot_lab2/cmake" TYPE FILE FILES "/home/przewnic/Documents/ANRO/anro-rzewnicki_kowalski/build/testbot_lab2/catkin_generated/installspace/testbot_lab2-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/testbot_lab2/cmake" TYPE FILE FILES
    "/home/przewnic/Documents/ANRO/anro-rzewnicki_kowalski/build/testbot_lab2/catkin_generated/installspace/testbot_lab2Config.cmake"
    "/home/przewnic/Documents/ANRO/anro-rzewnicki_kowalski/build/testbot_lab2/catkin_generated/installspace/testbot_lab2Config-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/testbot_lab2" TYPE FILE FILES "/home/przewnic/Documents/ANRO/anro-rzewnicki_kowalski/src/testbot_lab2/package.xml")
endif()

