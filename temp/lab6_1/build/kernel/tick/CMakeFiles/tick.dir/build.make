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
CMAKE_SOURCE_DIR = /home/wang/VScode/lab6/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wang/VScode/lab6/build

# Include any dependencies generated for this target.
include kernel/tick/CMakeFiles/tick.dir/depend.make

# Include the progress variables for this target.
include kernel/tick/CMakeFiles/tick.dir/progress.make

# Include the compile flags for this target's objects.
include kernel/tick/CMakeFiles/tick.dir/flags.make

kernel/tick/CMakeFiles/tick.dir/prt_tick.c.obj: kernel/tick/CMakeFiles/tick.dir/flags.make
kernel/tick/CMakeFiles/tick.dir/prt_tick.c.obj: /home/wang/VScode/lab6/src/kernel/tick/prt_tick.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wang/VScode/lab6/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object kernel/tick/CMakeFiles/tick.dir/prt_tick.c.obj"
	cd /home/wang/VScode/lab6/build/kernel/tick && /home/wang/opreatingSystem/practice/aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tick.dir/prt_tick.c.obj   -c /home/wang/VScode/lab6/src/kernel/tick/prt_tick.c

kernel/tick/CMakeFiles/tick.dir/prt_tick.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tick.dir/prt_tick.c.i"
	cd /home/wang/VScode/lab6/build/kernel/tick && /home/wang/opreatingSystem/practice/aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wang/VScode/lab6/src/kernel/tick/prt_tick.c > CMakeFiles/tick.dir/prt_tick.c.i

kernel/tick/CMakeFiles/tick.dir/prt_tick.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tick.dir/prt_tick.c.s"
	cd /home/wang/VScode/lab6/build/kernel/tick && /home/wang/opreatingSystem/practice/aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wang/VScode/lab6/src/kernel/tick/prt_tick.c -o CMakeFiles/tick.dir/prt_tick.c.s

tick: kernel/tick/CMakeFiles/tick.dir/prt_tick.c.obj
tick: kernel/tick/CMakeFiles/tick.dir/build.make

.PHONY : tick

# Rule to build all files generated by this target.
kernel/tick/CMakeFiles/tick.dir/build: tick

.PHONY : kernel/tick/CMakeFiles/tick.dir/build

kernel/tick/CMakeFiles/tick.dir/clean:
	cd /home/wang/VScode/lab6/build/kernel/tick && $(CMAKE_COMMAND) -P CMakeFiles/tick.dir/cmake_clean.cmake
.PHONY : kernel/tick/CMakeFiles/tick.dir/clean

kernel/tick/CMakeFiles/tick.dir/depend:
	cd /home/wang/VScode/lab6/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wang/VScode/lab6/src /home/wang/VScode/lab6/src/kernel/tick /home/wang/VScode/lab6/build /home/wang/VScode/lab6/build/kernel/tick /home/wang/VScode/lab6/build/kernel/tick/CMakeFiles/tick.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : kernel/tick/CMakeFiles/tick.dir/depend

