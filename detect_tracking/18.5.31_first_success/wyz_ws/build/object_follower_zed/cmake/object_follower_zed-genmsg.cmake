# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "object_follower_zed: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iobject_follower_zed:/home/ubuntu/WYZ/wyz_ws/src/object_follower_zed/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(object_follower_zed_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/object_follower_zed/msg/zed_roi.msg" NAME_WE)
add_custom_target(_object_follower_zed_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "object_follower_zed" "/home/ubuntu/WYZ/wyz_ws/src/object_follower_zed/msg/zed_roi.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(object_follower_zed
  "/home/ubuntu/WYZ/wyz_ws/src/object_follower_zed/msg/zed_roi.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/object_follower_zed
)

### Generating Services

### Generating Module File
_generate_module_cpp(object_follower_zed
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/object_follower_zed
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(object_follower_zed_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(object_follower_zed_generate_messages object_follower_zed_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/object_follower_zed/msg/zed_roi.msg" NAME_WE)
add_dependencies(object_follower_zed_generate_messages_cpp _object_follower_zed_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(object_follower_zed_gencpp)
add_dependencies(object_follower_zed_gencpp object_follower_zed_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS object_follower_zed_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(object_follower_zed
  "/home/ubuntu/WYZ/wyz_ws/src/object_follower_zed/msg/zed_roi.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/object_follower_zed
)

### Generating Services

### Generating Module File
_generate_module_eus(object_follower_zed
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/object_follower_zed
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(object_follower_zed_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(object_follower_zed_generate_messages object_follower_zed_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/object_follower_zed/msg/zed_roi.msg" NAME_WE)
add_dependencies(object_follower_zed_generate_messages_eus _object_follower_zed_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(object_follower_zed_geneus)
add_dependencies(object_follower_zed_geneus object_follower_zed_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS object_follower_zed_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(object_follower_zed
  "/home/ubuntu/WYZ/wyz_ws/src/object_follower_zed/msg/zed_roi.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/object_follower_zed
)

### Generating Services

### Generating Module File
_generate_module_lisp(object_follower_zed
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/object_follower_zed
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(object_follower_zed_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(object_follower_zed_generate_messages object_follower_zed_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/object_follower_zed/msg/zed_roi.msg" NAME_WE)
add_dependencies(object_follower_zed_generate_messages_lisp _object_follower_zed_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(object_follower_zed_genlisp)
add_dependencies(object_follower_zed_genlisp object_follower_zed_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS object_follower_zed_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(object_follower_zed
  "/home/ubuntu/WYZ/wyz_ws/src/object_follower_zed/msg/zed_roi.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/object_follower_zed
)

### Generating Services

### Generating Module File
_generate_module_nodejs(object_follower_zed
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/object_follower_zed
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(object_follower_zed_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(object_follower_zed_generate_messages object_follower_zed_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/object_follower_zed/msg/zed_roi.msg" NAME_WE)
add_dependencies(object_follower_zed_generate_messages_nodejs _object_follower_zed_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(object_follower_zed_gennodejs)
add_dependencies(object_follower_zed_gennodejs object_follower_zed_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS object_follower_zed_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(object_follower_zed
  "/home/ubuntu/WYZ/wyz_ws/src/object_follower_zed/msg/zed_roi.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/object_follower_zed
)

### Generating Services

### Generating Module File
_generate_module_py(object_follower_zed
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/object_follower_zed
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(object_follower_zed_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(object_follower_zed_generate_messages object_follower_zed_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/WYZ/wyz_ws/src/object_follower_zed/msg/zed_roi.msg" NAME_WE)
add_dependencies(object_follower_zed_generate_messages_py _object_follower_zed_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(object_follower_zed_genpy)
add_dependencies(object_follower_zed_genpy object_follower_zed_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS object_follower_zed_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/object_follower_zed)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/object_follower_zed
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/object_follower_zed)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/object_follower_zed
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/object_follower_zed)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/object_follower_zed
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/object_follower_zed)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/object_follower_zed
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/object_follower_zed)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/object_follower_zed\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/object_follower_zed
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
