#! /bin/bash

BASE_DIR=`pwd`
mkdir src
mkdir unittest
mkdir build
mkdir lib

mkdir thirdparty
cd thirdparty

mkdir googletest
cd googletest

# Get a copy of gtest and keep it in thirdparty/googletest
wget -q https://github.com/google/googletest/archive/master.zip
unzip -qq master.zip 
rm master.zip
mv googletest-master/* .
rm -rf googletest-master
GTEST_ROOT="`pwd`/googletest"

# Googletest source code now lives in thirdparty/googletest
# Build a gtest library, and move it to the lib directory
cd ../../
 
g++ -I$GTEST_ROOT/include -I$GTEST_ROOT -c $GTEST_ROOT/src/gtest-all.cc
ar -rv libgtest.a gtest-all.o

mv libgtest.a lib
rm gtest-all.o

