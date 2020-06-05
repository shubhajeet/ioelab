cmake_minimum_required(VERSION 2.6)
project (CheVisualizer)

# version number
set (CheVisualizer VERSION_MAJOR 1)
set (CheVisualizer VERSION_MINOR 0)

# configure a header file to pass some of the CMake settings
configure_file (
          "${PROJECT_SOURCE_DIR}/Config.h.in"
          "${PROJECT_SOURCE_DIR}/Config.h"
          )

# add the binary tree to the search path for include files
include_directories("${PROJECT_BINARY_DIR}")

find_package(OpenGL REQUIRED)
find_package(GLEW REQUIRED)
find_package(GLUT REQUIRED)

include_directories( ${OPENGL_INCLUDE_DIRS} ${GLUT_INCLUDE_DIRS} ${GLEW_INCLUDE_DIRS})

add_library(GUI Window.cpp)
target_link_libraries(GUI ${OPENGL_LIBRARIES} ${GLUT_LIBRARY} ${GLEW_LIBRARY})

# add_library(math Matrics.cpp)
# target_link_libraries(math ${GLM_LIBRARY})

# add executable
add_executable(CheVisualizer main.cpp)
target_link_libraries(CheVisualizer ${OPENGL_LIBRARIES} ${GLUT_LIBRARY} ${GLEW_LIBRARY} GUI)

# install
install(TARGETS CheVisualizer DESTINATION bin)
