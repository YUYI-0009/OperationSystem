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
CMAKE_SOURCE_DIR = /home/wang/opreatingSystem/lab6/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wang/opreatingSystem/lab6/build

# Include any dependencies generated for this target.
include CMakeFiles/miniEuler.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/miniEuler.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/miniEuler.dir/flags.make

CMakeFiles/miniEuler.dir/main.c.obj: CMakeFiles/miniEuler.dir/flags.make
CMakeFiles/miniEuler.dir/main.c.obj: /home/wang/opreatingSystem/lab6/src/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wang/opreatingSystem/lab6/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/miniEuler.dir/main.c.obj"
	/home/wang/opreatingSystem/practice/aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/miniEuler.dir/main.c.obj   -c /home/wang/opreatingSystem/lab6/src/main.c

CMakeFiles/miniEuler.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/miniEuler.dir/main.c.i"
	/home/wang/opreatingSystem/practice/aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wang/opreatingSystem/lab6/src/main.c > CMakeFiles/miniEuler.dir/main.c.i

CMakeFiles/miniEuler.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/miniEuler.dir/main.c.s"
	/home/wang/opreatingSystem/practice/aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wang/opreatingSystem/lab6/src/main.c -o CMakeFiles/miniEuler.dir/main.c.s

# Object files for target miniEuler
miniEuler_OBJECTS = \
"CMakeFiles/miniEuler.dir/main.c.obj"

# External object files for target miniEuler
miniEuler_EXTERNAL_OBJECTS = \
"/home/wang/opreatingSystem/lab6/build/bsp/CMakeFiles/bsp.dir/start.S.obj" \
"/home/wang/opreatingSystem/lab6/build/bsp/CMakeFiles/bsp.dir/prt_reset_vector.S.obj" \
"/home/wang/opreatingSystem/lab6/build/bsp/CMakeFiles/bsp.dir/print.c.obj" \
"/home/wang/opreatingSystem/lab6/build/bsp/CMakeFiles/bsp.dir/vsnprintf_s.c.obj" \
"/home/wang/opreatingSystem/lab6/build/bsp/CMakeFiles/bsp.dir/prt_vector.S.obj" \
"/home/wang/opreatingSystem/lab6/build/bsp/CMakeFiles/bsp.dir/prt_exc.c.obj" \
"/home/wang/opreatingSystem/lab6/build/bsp/CMakeFiles/bsp.dir/hwi_init.c.obj" \
"/home/wang/opreatingSystem/lab6/build/bsp/CMakeFiles/bsp.dir/timer.c.obj" \
"/home/wang/opreatingSystem/lab6/build/kernel/tick/CMakeFiles/tick.dir/prt_tick.c.obj" \
"/home/wang/opreatingSystem/lab6/build/kernel/task/CMakeFiles/task.dir/prt_sys.c.obj" \
"/home/wang/opreatingSystem/lab6/build/kernel/task/CMakeFiles/task.dir/prt_task_init.c.obj" \
"/home/wang/opreatingSystem/lab6/build/kernel/task/CMakeFiles/task.dir/prt_task.c.obj" \
"/home/wang/opreatingSystem/lab6/build/kernel/sched/CMakeFiles/sched.dir/prt_sched_single.c.obj"

miniEuler: CMakeFiles/miniEuler.dir/main.c.obj
miniEuler: bsp/CMakeFiles/bsp.dir/start.S.obj
miniEuler: bsp/CMakeFiles/bsp.dir/prt_reset_vector.S.obj
miniEuler: bsp/CMakeFiles/bsp.dir/print.c.obj
miniEuler: bsp/CMakeFiles/bsp.dir/vsnprintf_s.c.obj
miniEuler: bsp/CMakeFiles/bsp.dir/prt_vector.S.obj
miniEuler: bsp/CMakeFiles/bsp.dir/prt_exc.c.obj
miniEuler: bsp/CMakeFiles/bsp.dir/hwi_init.c.obj
miniEuler: bsp/CMakeFiles/bsp.dir/timer.c.obj
miniEuler: kernel/tick/CMakeFiles/tick.dir/prt_tick.c.obj
miniEuler: kernel/task/CMakeFiles/task.dir/prt_sys.c.obj
miniEuler: kernel/task/CMakeFiles/task.dir/prt_task_init.c.obj
miniEuler: kernel/task/CMakeFiles/task.dir/prt_task.c.obj
miniEuler: kernel/sched/CMakeFiles/sched.dir/prt_sched_single.c.obj
miniEuler: CMakeFiles/miniEuler.dir/build.make
miniEuler: CMakeFiles/miniEuler.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wang/opreatingSystem/lab6/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable miniEuler"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/miniEuler.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/miniEuler.dir/build: miniEuler

.PHONY : CMakeFiles/miniEuler.dir/build

CMakeFiles/miniEuler.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/miniEuler.dir/cmake_clean.cmake
.PHONY : CMakeFiles/miniEuler.dir/clean

CMakeFiles/miniEuler.dir/depend:
	cd /home/wang/opreatingSystem/lab6/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wang/opreatingSystem/lab6/src /home/wang/opreatingSystem/lab6/src /home/wang/opreatingSystem/lab6/build /home/wang/opreatingSystem/lab6/build /home/wang/opreatingSystem/lab6/build/CMakeFiles/miniEuler.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/miniEuler.dir/depend

