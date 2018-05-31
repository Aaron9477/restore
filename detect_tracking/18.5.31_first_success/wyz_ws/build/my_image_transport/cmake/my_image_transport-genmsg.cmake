# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "my_image_transport: 2 messages, 0 services")

set(MSG_I_FLAGS "-Imy_image_transport:/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(my_image_transport_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/Box.msg" NAME_WE)
add_custom_target(_my_image_transport_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_image_transport" "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/Box.msg" ""
)

get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/zed_roi.msg" NAME_WE)
add_custom_target(_my_image_transport_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_image_transport" "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/zed_roi.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(my_image_transport
  "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/Box.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_image_transport
)
_generate_msg_cpp(my_image_transport
  "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/zed_roi.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_image_transport
)

### Generating Services

### Generating Module File
_generate_module_cpp(my_image_transport
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_image_transport
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(my_image_transport_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(my_image_transport_generate_messages my_image_transport_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/Box.msg" NAME_WE)
add_dependencies(my_image_transport_generate_messages_cpp _my_image_transport_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/zed_roi.msg" NAME_WE)
add_dependencies(my_image_transport_generate_messages_cpp _my_image_transport_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_image_transport_gencpp)
add_dependencies(my_image_transport_gencpp my_image_transport_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_image_transport_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(my_image_transport
  "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/Box.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_image_transport
)
_generate_msg_eus(my_image_transport
  "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/zed_roi.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_image_transport
)

### Generating Services

### Generating Module File
_generate_module_eus(my_image_transport
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_image_transport
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(my_image_transport_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(my_image_transport_generate_messages my_image_transport_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/Box.msg" NAME_WE)
add_dependencies(my_image_transport_generate_messages_eus _my_image_transport_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/zed_roi.msg" NAME_WE)
add_dependencies(my_image_transport_generate_messages_eus _my_image_transport_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_image_transport_geneus)
add_dependencies(my_image_transport_geneus my_image_transport_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_image_transport_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(my_image_transport
  "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/Box.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_image_transport
)
_generate_msg_lisp(my_image_transport
  "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/zed_roi.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_image_transport
)

### Generating Services

### Generating Module File
_generate_module_lisp(my_image_transport
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_image_transport
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(my_image_transport_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(my_image_transport_generate_messages my_image_transport_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/Box.msg" NAME_WE)
add_dependencies(my_image_transport_generate_messages_lisp _my_image_transport_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/zed_roi.msg" NAME_WE)
add_dependencies(my_image_transport_generate_messages_lisp _my_image_transport_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_image_transport_genlisp)
add_dependencies(my_image_transport_genlisp my_image_transport_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_image_transport_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(my_image_transport
  "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/Box.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_image_transport
)
_generate_msg_nodejs(my_image_transport
  "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/zed_roi.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_image_transport
)

### Generating Services

### Generating Module File
_generate_module_nodejs(my_image_transport
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_image_transport
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(my_image_transport_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(my_image_transport_generate_messages my_image_transport_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/Box.msg" NAME_WE)
add_dependencies(my_image_transport_generate_messages_nodejs _my_image_transport_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/zed_roi.msg" NAME_WE)
add_dependencies(my_image_transport_generate_messages_nodejs _my_image_transport_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_image_transport_gennodejs)
add_dependencies(my_image_transport_gennodejs my_image_transport_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_image_transport_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(my_image_transport
  "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/Box.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_image_transport
)
_generate_msg_py(my_image_transport
  "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/zed_roi.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_image_transport
)

### Generating Services

### Generating Module File
_generate_module_py(my_image_transport
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_image_transport
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(my_image_transport_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(my_image_transport_generate_messages my_image_transport_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/Box.msg" NAME_WE)
add_dependencies(my_image_transport_generate_messages_py _my_image_transport_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg/zed_roi.msg" NAME_WE)
add_dependencies(my_image_transport_generate_messages_py _my_image_transport_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_image_transport_genpy)
add_dependencies(my_image_transport_genpy my_image_transport_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_image_transport_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_image_transport)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_image_transport
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_image_transport)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_image_transport
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_image_transport)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_image_transport
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_image_transport)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_image_transport
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_image_transport)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_image_transport\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_image_transport
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
