# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

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
CMAKE_SOURCE_DIR = /home/chenjh2002/软件实践/cmake_practice

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/chenjh2002/软件实践/cmake_practice

# Include any dependencies generated for this target.
include src/CMakeFiles/testcmake.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/testcmake.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/testcmake.dir/flags.make

src/CMakeFiles/testcmake.dir/test.c.o: src/CMakeFiles/testcmake.dir/flags.make
src/CMakeFiles/testcmake.dir/test.c.o: src/test.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/chenjh2002/软件实践/cmake_practice/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/CMakeFiles/testcmake.dir/test.c.o"
	cd /home/chenjh2002/软件实践/cmake_practice/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/testcmake.dir/test.c.o   -c /home/chenjh2002/软件实践/cmake_practice/src/test.c

src/CMakeFiles/testcmake.dir/test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/testcmake.dir/test.c.i"
	cd /home/chenjh2002/软件实践/cmake_practice/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/chenjh2002/软件实践/cmake_practice/src/test.c > CMakeFiles/testcmake.dir/test.c.i

src/CMakeFiles/testcmake.dir/test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/testcmake.dir/test.c.s"
	cd /home/chenjh2002/软件实践/cmake_practice/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/chenjh2002/软件实践/cmake_practice/src/test.c -o CMakeFiles/testcmake.dir/test.c.s

# Object files for target testcmake
testcmake_OBJECTS = \
"CMakeFiles/testcmake.dir/test.c.o"

# External object files for target testcmake
testcmake_EXTERNAL_OBJECTS =

src/testcmake: src/CMakeFiles/testcmake.dir/test.c.o
src/testcmake: src/CMakeFiles/testcmake.dir/build.make
src/testcmake: libs/liba.a
src/testcmake: libs/libb.a
src/testcmake: src/CMakeFiles/testcmake.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/chenjh2002/软件实践/cmake_practice/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable testcmake"
	cd /home/chenjh2002/软件实践/cmake_practice/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testcmake.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/testcmake.dir/build: src/testcmake

.PHONY : src/CMakeFiles/testcmake.dir/build

src/CMakeFiles/testcmake.dir/clean:
	cd /home/chenjh2002/软件实践/cmake_practice/src && $(CMAKE_COMMAND) -P CMakeFiles/testcmake.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/testcmake.dir/clean

src/CMakeFiles/testcmake.dir/depend:
	cd /home/chenjh2002/软件实践/cmake_practice && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/chenjh2002/软件实践/cmake_practice /home/chenjh2002/软件实践/cmake_practice/src /home/chenjh2002/软件实践/cmake_practice /home/chenjh2002/软件实践/cmake_practice/src /home/chenjh2002/软件实践/cmake_practice/src/CMakeFiles/testcmake.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/testcmake.dir/depend

