cmake_minimum_required(VERSION 2.8.3)
project(zed_tracking)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  cv_bridge
  image_transport
  roscpp
  rospy
  std_msgs
  message_generation
  nodelet
  tf2_ros
)
find_package(ZED 2.1 REQUIRED)

##For Jetson, OpenCV4Tegra is based on OpenCV2.4

#elseif(CMAKE_SYSTEM_NAME2 MATCHES "armv7l" ) # K1
SET(OCV_VERSION "2.4")
SET(CUDA_VERSION "8.0")


find_package(OpenCV ${OCV_VERSION} COMPONENTS core highgui imgproc REQUIRED)
find_package(CUDA ${CUDA_VERSION} REQUIRED)

find_package(PCL REQUIRED)

## Generate messages in the 'msg' folder
 add_message_files(
   FILES
   Box.msg
 )
## Generate added messages and services with any dependencies listed here
 generate_messages(
 )
#generate_dynamic_reconfigure_options(
#  cfg/Zed.cfg
#)
###################################
## catkin specific configuration ##
###################################
catkin_package(
  CATKIN_DEPENDS
    roscpp
    sensor_msgs
    opencv
    image_transport
    message_runtime
    tf2_ros
)

###############################################################################
# INCLUDES

# Specify locations of header files.
include_directories(
	${catkin_INCLUDE_DIRS}
	${CUDA_INCLUDE_DIRS}
	${ZED_INCLUDE_DIRS}
	${OpenCV_INCLUDE_DIRS}
	${PCL_INCLUDE_DIRS}
)

link_directories(${ZED_LIBRARY_DIR})
link_directories(${CUDA_LIBRARY_DIRS})
link_directories(${OpenCV_LIBRARY_DIRS})
link_directories(${PCL_LIBRARY_DIRS})

###############################################################################

###############################################################################
# EXECUTABLE

add_definitions(-std=c++11)# -m64) #-Wall)


add_executable(
  zed_tracking_node
  src/zed_tracking_node.cpp
  src/STCTracker.cpp
)

target_link_libraries(
        zed_tracking_node
        ${catkin_LIBRARIES}
        ${ZED_LIBRARIES}
	${CUDA_LIBRARIES} ${CUDA_nppi_LIBRARY} ${CUDA_npps_LIBRARY}
        ${OpenCV_LIBS}
        ${PCL_LIBRARIES}
    )
add_dependencies(zed_tracking_node ${PROJECT_NAME}_gencfg)






