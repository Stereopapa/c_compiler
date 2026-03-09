#!/bin/bash
echo "Installing dependencies"
sudo apt update && sudo apt install -y bison flex build-essential libfl-dev liby-dev

echo "Building Solution"
cmake -B build
cmake --build build

echo "----------------------------------------------------------------------"
echo "build ended successfully!"
echo "you can run program by ./bin/c_compiler < in_file_path > out_file_path"
echo "----------------------------------------------------------------------"