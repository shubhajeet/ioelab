# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.2

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sujit/graphics/chevisualizer/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sujit/graphics/chevisualizer/bin

# Include any dependencies generated for this target.
include CMakeFiles/math.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/math.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/math.dir/flags.make

CMakeFiles/math.dir/Matrics.cpp.o: CMakeFiles/math.dir/flags.make
CMakeFiles/math.dir/Matrics.cpp.o: /home/sujit/graphics/chevisualizer/src/Matrics.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sujit/graphics/chevisualizer/bin/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/math.dir/Matrics.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/math.dir/Matrics.cpp.o -c /home/sujit/graphics/chevisualizer/src/Matrics.cpp

CMakeFiles/math.dir/Matrics.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/math.dir/Matrics.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/sujit/graphics/chevisualizer/src/Matrics.cpp > CMakeFiles/math.dir/Matrics.cpp.i

CMakeFiles/math.dir/Matrics.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/math.dir/Matrics.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/sujit/graphics/chevisualizer/src/Matrics.cpp -o CMakeFiles/math.dir/Matrics.cpp.s

CMakeFiles/math.dir/Matrics.cpp.o.requires:
.PHONY : CMakeFiles/math.dir/Matrics.cpp.o.requires

CMakeFiles/math.dir/Matrics.cpp.o.provides: CMakeFiles/math.dir/Matrics.cpp.o.requires
	$(MAKE) -f CMakeFiles/math.dir/build.make CMakeFiles/math.dir/Matrics.cpp.o.provides.build
.PHONY : CMakeFiles/math.dir/Matrics.cpp.o.provides

CMakeFiles/math.dir/Matrics.cpp.o.provides.build: CMakeFiles/math.dir/Matrics.cpp.o

# Object files for target math
math_OBJECTS = \
"CMakeFiles/math.dir/Matrics.cpp.o"

# External object files for target math
math_EXTERNAL_OBJECTS =

libmath.a: CMakeFiles/math.dir/Matrics.cpp.o
libmath.a: CMakeFiles/math.dir/build.make
libmath.a: CMakeFiles/math.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libmath.a"
	$(CMAKE_COMMAND) -P CMakeFiles/math.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/math.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/math.dir/build: libmath.a
.PHONY : CMakeFiles/math.dir/build

CMakeFiles/math.dir/requires: CMakeFiles/math.dir/Matrics.cpp.o.requires
.PHONY : CMakeFiles/math.dir/requires

CMakeFiles/math.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/math.dir/cmake_clean.cmake
.PHONY : CMakeFiles/math.dir/clean

CMakeFiles/math.dir/depend:
	cd /home/sujit/graphics/chevisualizer/bin && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sujit/graphics/chevisualizer/src /home/sujit/graphics/chevisualizer/src /home/sujit/graphics/chevisualizer/bin /home/sujit/graphics/chevisualizer/bin /home/sujit/graphics/chevisualizer/bin/CMakeFiles/math.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/math.dir/depend
