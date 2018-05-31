# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "zed_tracking: 2 messages, 0 services")

set(MSG_I_FLAGS "-Ized_tracking:/home/ubuntu/WYZ/wyz_ws/src/zed_tracking/msg")

# Find all generators

add_custom_target(zed_tracking_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/zed_tracking/msg/zed_roi.msg" NAME_WE)
add_custom_target(_zed_tracking_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "zed_tracking" "/home/ubuntu/WYZ/wyz_ws/src/zed_tracking/msg/zed_roi.msg" ""
)

get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/zed_tracking/msg/Box.msg" NAME_WE)
add_custom_target(_zed_tracking_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "zed_tracking" "/home/ubuntu/WYZ/wyz_ws/src/zed_tracking/msg/Box.msg" ""
)

#
#  langs = 
#


