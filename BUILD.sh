#!/bin/bash

# This script is used to generate a C++ project
# with conan and cmake.
# Written by: utfeight
# Date: 2023-07-23
# Version: 0.1.0
# License: MIT
#
# Usage: ./BUILD.sh.sh <project_name>
# Example: ./BUILD.sh.sh my_project
#
# This will generate a project named my_project
# with a conanfile.py and a CMakeLists.txt.
# You can use conan to install dependencies and
# cmake to build the project.
#
# Credits:
#   - cpp-templat       : https://github.com/filipdutescu/modern-cpp-template/
#   - readme-template   : https://github.com/othneildrew/Best-README-Template/

# Help message
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
	# Non colorized:
	# echo "Usage: ./BUILD.sh <project_name>"
	# echo ""
	# echo "--install        : Install ./BUILD.sh to /usr/local/bin"
	# echo "--install --force: Override ./BUILD.sh to /usr/local/bin"

	# Colorized vibrantly:
	# with the same text above
	echo -e "\033[32mUsage: ./BUILD.sh [ARGS]]\033[0m"
	echo ""
  echo -e "\033[32m\033[36m--all\033[0m"
	echo -e "\033[32m\033[36m--clean\033[0m"
	echo -e "\033[32m\033[36m--depend\033[0m"
	echo -e "\033[32m\033[36m--edit_cache\033[0m"
	echo -e "\033[32m\033[36m--install\033[0m"
	echo -e "\033[32m\033[36m--install/local\033[0m"
	echo -e "\033[32m\033[36m--install/strip\033[0m"
	echo -e "\033[32m\033[36m--list_install_components\033[0m"
	echo -e "\033[32m\033[36m--rebuild_cache\033[0m"
	echo -e "\033[32m\033[36m--test\033[0m"
	echo -e "\033[32m\033[36m--clang-format\033[0m"
	# echo -e "\033[32m\033[36m--\033[0m        : "
  echo ""
	echo -e "\033[32m\033[36mMORE INFO:\033[0m"
  echo ""
  cd build || exit
  make help
	exit 0

fi

arg=$1
# remove -- from arg
arg=${arg:2}

echo $arg

if [ ! -d "build" ]; then
  mkdir build
fi

cd build  || exit

# Build process

# in case tests, build first
if [ "$arg" = "test" ]; then
  make all
  GTEST_COLOR=1 ctest -VV
  exit 0
fi


cmake ..  || exit
make $arg || exit
