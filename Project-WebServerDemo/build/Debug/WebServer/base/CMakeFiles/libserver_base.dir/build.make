# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/cmake/bin/cmake

# The command to remove a file.
RM = /usr/local/cmake/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug

# Include any dependencies generated for this target.
include WebServer/base/CMakeFiles/libserver_base.dir/depend.make

# Include the progress variables for this target.
include WebServer/base/CMakeFiles/libserver_base.dir/progress.make

# Include the compile flags for this target's objects.
include WebServer/base/CMakeFiles/libserver_base.dir/flags.make

WebServer/base/CMakeFiles/libserver_base.dir/AsyncLogging.cpp.o: WebServer/base/CMakeFiles/libserver_base.dir/flags.make
WebServer/base/CMakeFiles/libserver_base.dir/AsyncLogging.cpp.o: /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/AsyncLogging.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object WebServer/base/CMakeFiles/libserver_base.dir/AsyncLogging.cpp.o"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/libserver_base.dir/AsyncLogging.cpp.o -c /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/AsyncLogging.cpp

WebServer/base/CMakeFiles/libserver_base.dir/AsyncLogging.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/libserver_base.dir/AsyncLogging.cpp.i"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/AsyncLogging.cpp > CMakeFiles/libserver_base.dir/AsyncLogging.cpp.i

WebServer/base/CMakeFiles/libserver_base.dir/AsyncLogging.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/libserver_base.dir/AsyncLogging.cpp.s"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/AsyncLogging.cpp -o CMakeFiles/libserver_base.dir/AsyncLogging.cpp.s

WebServer/base/CMakeFiles/libserver_base.dir/CountDownLatch.cpp.o: WebServer/base/CMakeFiles/libserver_base.dir/flags.make
WebServer/base/CMakeFiles/libserver_base.dir/CountDownLatch.cpp.o: /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/CountDownLatch.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object WebServer/base/CMakeFiles/libserver_base.dir/CountDownLatch.cpp.o"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/libserver_base.dir/CountDownLatch.cpp.o -c /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/CountDownLatch.cpp

WebServer/base/CMakeFiles/libserver_base.dir/CountDownLatch.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/libserver_base.dir/CountDownLatch.cpp.i"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/CountDownLatch.cpp > CMakeFiles/libserver_base.dir/CountDownLatch.cpp.i

WebServer/base/CMakeFiles/libserver_base.dir/CountDownLatch.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/libserver_base.dir/CountDownLatch.cpp.s"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/CountDownLatch.cpp -o CMakeFiles/libserver_base.dir/CountDownLatch.cpp.s

WebServer/base/CMakeFiles/libserver_base.dir/FileUtil.cpp.o: WebServer/base/CMakeFiles/libserver_base.dir/flags.make
WebServer/base/CMakeFiles/libserver_base.dir/FileUtil.cpp.o: /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/FileUtil.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object WebServer/base/CMakeFiles/libserver_base.dir/FileUtil.cpp.o"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/libserver_base.dir/FileUtil.cpp.o -c /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/FileUtil.cpp

WebServer/base/CMakeFiles/libserver_base.dir/FileUtil.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/libserver_base.dir/FileUtil.cpp.i"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/FileUtil.cpp > CMakeFiles/libserver_base.dir/FileUtil.cpp.i

WebServer/base/CMakeFiles/libserver_base.dir/FileUtil.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/libserver_base.dir/FileUtil.cpp.s"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/FileUtil.cpp -o CMakeFiles/libserver_base.dir/FileUtil.cpp.s

WebServer/base/CMakeFiles/libserver_base.dir/LogFile.cpp.o: WebServer/base/CMakeFiles/libserver_base.dir/flags.make
WebServer/base/CMakeFiles/libserver_base.dir/LogFile.cpp.o: /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/LogFile.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object WebServer/base/CMakeFiles/libserver_base.dir/LogFile.cpp.o"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/libserver_base.dir/LogFile.cpp.o -c /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/LogFile.cpp

WebServer/base/CMakeFiles/libserver_base.dir/LogFile.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/libserver_base.dir/LogFile.cpp.i"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/LogFile.cpp > CMakeFiles/libserver_base.dir/LogFile.cpp.i

WebServer/base/CMakeFiles/libserver_base.dir/LogFile.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/libserver_base.dir/LogFile.cpp.s"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/LogFile.cpp -o CMakeFiles/libserver_base.dir/LogFile.cpp.s

WebServer/base/CMakeFiles/libserver_base.dir/Logging.cpp.o: WebServer/base/CMakeFiles/libserver_base.dir/flags.make
WebServer/base/CMakeFiles/libserver_base.dir/Logging.cpp.o: /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/Logging.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object WebServer/base/CMakeFiles/libserver_base.dir/Logging.cpp.o"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/libserver_base.dir/Logging.cpp.o -c /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/Logging.cpp

WebServer/base/CMakeFiles/libserver_base.dir/Logging.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/libserver_base.dir/Logging.cpp.i"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/Logging.cpp > CMakeFiles/libserver_base.dir/Logging.cpp.i

WebServer/base/CMakeFiles/libserver_base.dir/Logging.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/libserver_base.dir/Logging.cpp.s"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/Logging.cpp -o CMakeFiles/libserver_base.dir/Logging.cpp.s

WebServer/base/CMakeFiles/libserver_base.dir/LogStream.cpp.o: WebServer/base/CMakeFiles/libserver_base.dir/flags.make
WebServer/base/CMakeFiles/libserver_base.dir/LogStream.cpp.o: /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/LogStream.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object WebServer/base/CMakeFiles/libserver_base.dir/LogStream.cpp.o"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/libserver_base.dir/LogStream.cpp.o -c /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/LogStream.cpp

WebServer/base/CMakeFiles/libserver_base.dir/LogStream.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/libserver_base.dir/LogStream.cpp.i"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/LogStream.cpp > CMakeFiles/libserver_base.dir/LogStream.cpp.i

WebServer/base/CMakeFiles/libserver_base.dir/LogStream.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/libserver_base.dir/LogStream.cpp.s"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/LogStream.cpp -o CMakeFiles/libserver_base.dir/LogStream.cpp.s

WebServer/base/CMakeFiles/libserver_base.dir/Thread.cpp.o: WebServer/base/CMakeFiles/libserver_base.dir/flags.make
WebServer/base/CMakeFiles/libserver_base.dir/Thread.cpp.o: /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/Thread.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object WebServer/base/CMakeFiles/libserver_base.dir/Thread.cpp.o"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/libserver_base.dir/Thread.cpp.o -c /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/Thread.cpp

WebServer/base/CMakeFiles/libserver_base.dir/Thread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/libserver_base.dir/Thread.cpp.i"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/Thread.cpp > CMakeFiles/libserver_base.dir/Thread.cpp.i

WebServer/base/CMakeFiles/libserver_base.dir/Thread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/libserver_base.dir/Thread.cpp.s"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base/Thread.cpp -o CMakeFiles/libserver_base.dir/Thread.cpp.s

# Object files for target libserver_base
libserver_base_OBJECTS = \
"CMakeFiles/libserver_base.dir/AsyncLogging.cpp.o" \
"CMakeFiles/libserver_base.dir/CountDownLatch.cpp.o" \
"CMakeFiles/libserver_base.dir/FileUtil.cpp.o" \
"CMakeFiles/libserver_base.dir/LogFile.cpp.o" \
"CMakeFiles/libserver_base.dir/Logging.cpp.o" \
"CMakeFiles/libserver_base.dir/LogStream.cpp.o" \
"CMakeFiles/libserver_base.dir/Thread.cpp.o"

# External object files for target libserver_base
libserver_base_EXTERNAL_OBJECTS =

WebServer/base/libserver_base.a: WebServer/base/CMakeFiles/libserver_base.dir/AsyncLogging.cpp.o
WebServer/base/libserver_base.a: WebServer/base/CMakeFiles/libserver_base.dir/CountDownLatch.cpp.o
WebServer/base/libserver_base.a: WebServer/base/CMakeFiles/libserver_base.dir/FileUtil.cpp.o
WebServer/base/libserver_base.a: WebServer/base/CMakeFiles/libserver_base.dir/LogFile.cpp.o
WebServer/base/libserver_base.a: WebServer/base/CMakeFiles/libserver_base.dir/Logging.cpp.o
WebServer/base/libserver_base.a: WebServer/base/CMakeFiles/libserver_base.dir/LogStream.cpp.o
WebServer/base/libserver_base.a: WebServer/base/CMakeFiles/libserver_base.dir/Thread.cpp.o
WebServer/base/libserver_base.a: WebServer/base/CMakeFiles/libserver_base.dir/build.make
WebServer/base/libserver_base.a: WebServer/base/CMakeFiles/libserver_base.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX static library libserver_base.a"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && $(CMAKE_COMMAND) -P CMakeFiles/libserver_base.dir/cmake_clean_target.cmake
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libserver_base.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
WebServer/base/CMakeFiles/libserver_base.dir/build: WebServer/base/libserver_base.a

.PHONY : WebServer/base/CMakeFiles/libserver_base.dir/build

WebServer/base/CMakeFiles/libserver_base.dir/clean:
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base && $(CMAKE_COMMAND) -P CMakeFiles/libserver_base.dir/cmake_clean.cmake
.PHONY : WebServer/base/CMakeFiles/libserver_base.dir/clean

WebServer/base/CMakeFiles/libserver_base.dir/depend:
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/base /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/base/CMakeFiles/libserver_base.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : WebServer/base/CMakeFiles/libserver_base.dir/depend

