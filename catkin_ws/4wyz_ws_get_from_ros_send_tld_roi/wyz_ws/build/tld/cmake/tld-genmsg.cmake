# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "tld: 1 messages, 0 services")

set(MSG_I_FLAGS "-Itld:/home/zq610/WYZ/wyz_ws/src/tld/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(tld_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zq610/WYZ/wyz_ws/src/tld/msg/output.msg" NAME_WE)
add_custom_target(_tld_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tld" "/home/zq610/WYZ/wyz_ws/src/tld/msg/output.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(tld
  "/home/zq610/WYZ/wyz_ws/src/tld/msg/output.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tld
)

### Generating Services

### Generating Module File
_generate_module_cpp(tld
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tld
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(tld_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(tld_generate_messages tld_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zq610/WYZ/wyz_ws/src/tld/msg/output.msg" NAME_WE)
add_dependencies(tld_generate_messages_cpp _tld_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tld_gencpp)
add_dependencies(tld_gencpp tld_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tld_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(tld
  "/home/zq610/WYZ/wyz_ws/src/tld/msg/output.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tld
)

### Generating Services

### Generating Module File
_generate_module_eus(tld
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tld
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(tld_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(tld_generate_messages tld_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zq610/WYZ/wyz_ws/src/tld/msg/output.msg" NAME_WE)
add_dependencies(tld_generate_messages_eus _tld_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tld_geneus)
add_dependencies(tld_geneus tld_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tld_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(tld
  "/home/zq610/WYZ/wyz_ws/src/tld/msg/output.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tld
)

### Generating Services

### Generating Module File
_generate_module_lisp(tld
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tld
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(tld_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(tld_generate_messages tld_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zq610/WYZ/wyz_ws/src/tld/msg/output.msg" NAME_WE)
add_dependencies(tld_generate_messages_lisp _tld_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tld_genlisp)
add_dependencies(tld_genlisp tld_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tld_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(tld
  "/home/zq610/WYZ/wyz_ws/src/tld/msg/output.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tld
)

### Generating Services

### Generating Module File
_generate_module_nodejs(tld
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tld
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(tld_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(tld_generate_messages tld_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zq610/WYZ/wyz_ws/src/tld/msg/output.msg" NAME_WE)
add_dependencies(tld_generate_messages_nodejs _tld_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tld_gennodejs)
add_dependencies(tld_gennodejs tld_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tld_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(tld
  "/home/zq610/WYZ/wyz_ws/src/tld/msg/output.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tld
)

### Generating Services

### Generating Module File
_generate_module_py(tld
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tld
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(tld_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(tld_generate_messages tld_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zq610/WYZ/wyz_ws/src/tld/msg/output.msg" NAME_WE)
add_dependencies(tld_generate_messages_py _tld_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tld_genpy)
add_dependencies(tld_genpy tld_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tld_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tld)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tld
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(tld_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tld)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tld
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(tld_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tld)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tld
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(tld_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tld)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tld
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(tld_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tld)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tld\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tld
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(tld_generate_messages_py std_msgs_generate_messages_py)
endif()
