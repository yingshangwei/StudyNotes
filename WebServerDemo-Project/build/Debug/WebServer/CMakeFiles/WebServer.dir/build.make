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
include WebServer/CMakeFiles/WebServer.dir/depend.make

# Include the progress variables for this target.
include WebServer/CMakeFiles/WebServer.dir/progress.make

# Include the compile flags for this target's objects.
include WebServer/CMakeFiles/WebServer.dir/flags.make

WebServer/CMakeFiles/WebServer.dir/Channel.cpp.o: WebServer/CMakeFiles/WebServer.dir/flags.make
WebServer/CMakeFiles/WebServer.dir/Channel.cpp.o: /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Channel.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object WebServer/CMakeFiles/WebServer.dir/Channel.cpp.o"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/Channel.cpp.o -c /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Channel.cpp

WebServer/CMakeFiles/WebServer.dir/Channel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/Channel.cpp.i"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Channel.cpp > CMakeFiles/WebServer.dir/Channel.cpp.i

WebServer/CMakeFiles/WebServer.dir/Channel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/Channel.cpp.s"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Channel.cpp -o CMakeFiles/WebServer.dir/Channel.cpp.s

WebServer/CMakeFiles/WebServer.dir/Epoll.cpp.o: WebServer/CMakeFiles/WebServer.dir/flags.make
WebServer/CMakeFiles/WebServer.dir/Epoll.cpp.o: /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Epoll.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object WebServer/CMakeFiles/WebServer.dir/Epoll.cpp.o"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/Epoll.cpp.o -c /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Epoll.cpp

WebServer/CMakeFiles/WebServer.dir/Epoll.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/Epoll.cpp.i"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Epoll.cpp > CMakeFiles/WebServer.dir/Epoll.cpp.i

WebServer/CMakeFiles/WebServer.dir/Epoll.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/Epoll.cpp.s"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Epoll.cpp -o CMakeFiles/WebServer.dir/Epoll.cpp.s

WebServer/CMakeFiles/WebServer.dir/EventLoop.cpp.o: WebServer/CMakeFiles/WebServer.dir/flags.make
WebServer/CMakeFiles/WebServer.dir/EventLoop.cpp.o: /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/EventLoop.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object WebServer/CMakeFiles/WebServer.dir/EventLoop.cpp.o"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/EventLoop.cpp.o -c /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/EventLoop.cpp

WebServer/CMakeFiles/WebServer.dir/EventLoop.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/EventLoop.cpp.i"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/EventLoop.cpp > CMakeFiles/WebServer.dir/EventLoop.cpp.i

WebServer/CMakeFiles/WebServer.dir/EventLoop.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/EventLoop.cpp.s"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/EventLoop.cpp -o CMakeFiles/WebServer.dir/EventLoop.cpp.s

WebServer/CMakeFiles/WebServer.dir/EventLoopThread.cpp.o: WebServer/CMakeFiles/WebServer.dir/flags.make
WebServer/CMakeFiles/WebServer.dir/EventLoopThread.cpp.o: /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/EventLoopThread.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object WebServer/CMakeFiles/WebServer.dir/EventLoopThread.cpp.o"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/EventLoopThread.cpp.o -c /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/EventLoopThread.cpp

WebServer/CMakeFiles/WebServer.dir/EventLoopThread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/EventLoopThread.cpp.i"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/EventLoopThread.cpp > CMakeFiles/WebServer.dir/EventLoopThread.cpp.i

WebServer/CMakeFiles/WebServer.dir/EventLoopThread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/EventLoopThread.cpp.s"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/EventLoopThread.cpp -o CMakeFiles/WebServer.dir/EventLoopThread.cpp.s

WebServer/CMakeFiles/WebServer.dir/EventLoopThreadPool.cpp.o: WebServer/CMakeFiles/WebServer.dir/flags.make
WebServer/CMakeFiles/WebServer.dir/EventLoopThreadPool.cpp.o: /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/EventLoopThreadPool.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object WebServer/CMakeFiles/WebServer.dir/EventLoopThreadPool.cpp.o"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/EventLoopThreadPool.cpp.o -c /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/EventLoopThreadPool.cpp

WebServer/CMakeFiles/WebServer.dir/EventLoopThreadPool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/EventLoopThreadPool.cpp.i"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/EventLoopThreadPool.cpp > CMakeFiles/WebServer.dir/EventLoopThreadPool.cpp.i

WebServer/CMakeFiles/WebServer.dir/EventLoopThreadPool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/EventLoopThreadPool.cpp.s"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/EventLoopThreadPool.cpp -o CMakeFiles/WebServer.dir/EventLoopThreadPool.cpp.s

WebServer/CMakeFiles/WebServer.dir/HttpData.cpp.o: WebServer/CMakeFiles/WebServer.dir/flags.make
WebServer/CMakeFiles/WebServer.dir/HttpData.cpp.o: /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/HttpData.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object WebServer/CMakeFiles/WebServer.dir/HttpData.cpp.o"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/HttpData.cpp.o -c /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/HttpData.cpp

WebServer/CMakeFiles/WebServer.dir/HttpData.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/HttpData.cpp.i"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/HttpData.cpp > CMakeFiles/WebServer.dir/HttpData.cpp.i

WebServer/CMakeFiles/WebServer.dir/HttpData.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/HttpData.cpp.s"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/HttpData.cpp -o CMakeFiles/WebServer.dir/HttpData.cpp.s

WebServer/CMakeFiles/WebServer.dir/Main.cpp.o: WebServer/CMakeFiles/WebServer.dir/flags.make
WebServer/CMakeFiles/WebServer.dir/Main.cpp.o: /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object WebServer/CMakeFiles/WebServer.dir/Main.cpp.o"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/Main.cpp.o -c /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Main.cpp

WebServer/CMakeFiles/WebServer.dir/Main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/Main.cpp.i"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Main.cpp > CMakeFiles/WebServer.dir/Main.cpp.i

WebServer/CMakeFiles/WebServer.dir/Main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/Main.cpp.s"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Main.cpp -o CMakeFiles/WebServer.dir/Main.cpp.s

WebServer/CMakeFiles/WebServer.dir/Server.cpp.o: WebServer/CMakeFiles/WebServer.dir/flags.make
WebServer/CMakeFiles/WebServer.dir/Server.cpp.o: /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Server.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object WebServer/CMakeFiles/WebServer.dir/Server.cpp.o"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/Server.cpp.o -c /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Server.cpp

WebServer/CMakeFiles/WebServer.dir/Server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/Server.cpp.i"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Server.cpp > CMakeFiles/WebServer.dir/Server.cpp.i

WebServer/CMakeFiles/WebServer.dir/Server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/Server.cpp.s"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Server.cpp -o CMakeFiles/WebServer.dir/Server.cpp.s

WebServer/CMakeFiles/WebServer.dir/Timer.cpp.o: WebServer/CMakeFiles/WebServer.dir/flags.make
WebServer/CMakeFiles/WebServer.dir/Timer.cpp.o: /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Timer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object WebServer/CMakeFiles/WebServer.dir/Timer.cpp.o"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/Timer.cpp.o -c /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Timer.cpp

WebServer/CMakeFiles/WebServer.dir/Timer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/Timer.cpp.i"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Timer.cpp > CMakeFiles/WebServer.dir/Timer.cpp.i

WebServer/CMakeFiles/WebServer.dir/Timer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/Timer.cpp.s"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Timer.cpp -o CMakeFiles/WebServer.dir/Timer.cpp.s

WebServer/CMakeFiles/WebServer.dir/Util.cpp.o: WebServer/CMakeFiles/WebServer.dir/flags.make
WebServer/CMakeFiles/WebServer.dir/Util.cpp.o: /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Util.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object WebServer/CMakeFiles/WebServer.dir/Util.cpp.o"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/Util.cpp.o -c /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Util.cpp

WebServer/CMakeFiles/WebServer.dir/Util.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/Util.cpp.i"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Util.cpp > CMakeFiles/WebServer.dir/Util.cpp.i

WebServer/CMakeFiles/WebServer.dir/Util.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/Util.cpp.s"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer/Util.cpp -o CMakeFiles/WebServer.dir/Util.cpp.s

# Object files for target WebServer
WebServer_OBJECTS = \
"CMakeFiles/WebServer.dir/Channel.cpp.o" \
"CMakeFiles/WebServer.dir/Epoll.cpp.o" \
"CMakeFiles/WebServer.dir/EventLoop.cpp.o" \
"CMakeFiles/WebServer.dir/EventLoopThread.cpp.o" \
"CMakeFiles/WebServer.dir/EventLoopThreadPool.cpp.o" \
"CMakeFiles/WebServer.dir/HttpData.cpp.o" \
"CMakeFiles/WebServer.dir/Main.cpp.o" \
"CMakeFiles/WebServer.dir/Server.cpp.o" \
"CMakeFiles/WebServer.dir/Timer.cpp.o" \
"CMakeFiles/WebServer.dir/Util.cpp.o"

# External object files for target WebServer
WebServer_EXTERNAL_OBJECTS =

WebServer/WebServer: WebServer/CMakeFiles/WebServer.dir/Channel.cpp.o
WebServer/WebServer: WebServer/CMakeFiles/WebServer.dir/Epoll.cpp.o
WebServer/WebServer: WebServer/CMakeFiles/WebServer.dir/EventLoop.cpp.o
WebServer/WebServer: WebServer/CMakeFiles/WebServer.dir/EventLoopThread.cpp.o
WebServer/WebServer: WebServer/CMakeFiles/WebServer.dir/EventLoopThreadPool.cpp.o
WebServer/WebServer: WebServer/CMakeFiles/WebServer.dir/HttpData.cpp.o
WebServer/WebServer: WebServer/CMakeFiles/WebServer.dir/Main.cpp.o
WebServer/WebServer: WebServer/CMakeFiles/WebServer.dir/Server.cpp.o
WebServer/WebServer: WebServer/CMakeFiles/WebServer.dir/Timer.cpp.o
WebServer/WebServer: WebServer/CMakeFiles/WebServer.dir/Util.cpp.o
WebServer/WebServer: WebServer/CMakeFiles/WebServer.dir/build.make
WebServer/WebServer: WebServer/base/libserver_base.a
WebServer/WebServer: WebServer/CMakeFiles/WebServer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Linking CXX executable WebServer"
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/WebServer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
WebServer/CMakeFiles/WebServer.dir/build: WebServer/WebServer

.PHONY : WebServer/CMakeFiles/WebServer.dir/build

WebServer/CMakeFiles/WebServer.dir/clean:
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer && $(CMAKE_COMMAND) -P CMakeFiles/WebServer.dir/cmake_clean.cmake
.PHONY : WebServer/CMakeFiles/WebServer.dir/clean

WebServer/CMakeFiles/WebServer.dir/depend:
	cd /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/WebServer/WebServer /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer /mnt/c/Users/Admin/Desktop/Git/StudyNotes/WebServerDemo-Project/build/Debug/WebServer/CMakeFiles/WebServer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : WebServer/CMakeFiles/WebServer.dir/depend

