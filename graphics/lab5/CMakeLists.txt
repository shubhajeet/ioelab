cmake_minimum_required(VERSION 2.6)
project (Transform)
# version number
set (Transform VERSION_MAJOR 1)
set (Transform VERSION_MINOR 0)

# configure a header file to pass some of the CMake settings
configure_file (
          "${PROJECT_SOURCE_DIR}/TransformConfig.h.in"
          "${PROJECT_BINARY_DIR}/TransformConfig.h"
          )

# add the binary tree to the search path for include files
include_directories("${PROJECT_BINARY_DIR}")

find_package(OpenGL REQUIRED)
find_package(GLEW REQUIRED)
find_package(GLUT REQUIRED)

include_directories( ${OPENGL_INCLUDE_DIRS} ${GLUT_INCLUDE_DIRS} ${GLEW_INCLUDE_DIRS})
add_library(Graphics Polygon.cpp Matrics.cpp Graphics.cpp)

# add executable
add_executable(Transform Transform.cpp)
target_link_libraries(Transform ${OPENGL_LIBRARIES} ${GLUT_LIBRARY} ${GLEW_LIBRARY} Graphics)

#install
install(TARGETS Transform DESTINATION bin)
