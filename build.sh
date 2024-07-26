#!/bin/bash

if ! command -v x86_64-w64-mingw32-g++ >/dev/null 2>&1; then
  echo "Error: MinGW-w64 is not installed. Please install it using 'sudo apt-get install mingw-w64' first."
  exit 1
fi

dllflags="-shared -s -Wl,--subsystem,windows,--out-implib,lib/libaddlib.a -static"
linkerflags="-o bin/main.dll"

x86_64-w64-mingw32-g++ $dllflags src/*.cpp $linkerflags

echo "Done"