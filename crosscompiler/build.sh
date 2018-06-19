#!/bin/bash

echo "Building and installing GCC and Binutils based cross compiler"

echo "Sourcing configurations"
source ./scripts/config.sh
mkdir -p $PREFIX

echo "Installing Dependencies"
bash ./scripts/install_deps.sh

echo "Grabbing GCC/Binutils zips"
bash ./scripts/get_zips.sh


echo "Unzipping tars"
cd ./src/
tar -xzf ../zips/gcc-$GCC_VERSION.tar.gz
tar -xzf ../zips/binutils-$BINUTILS_VERSION.tar.gz

echo "Building binutils"
mkdir build-binutils
cd build-binutils
../binutils-$BINUTILS_VERSION/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make
make install

echo "Building gcc"
cd ../
which -- $TARGET-as || echo "$TARGET-as is not in the PATH"

mkdir build-gcc
cd build-gcc
../gcc-$GCC_VERSION/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc
make all-target-libgcc
make install gcc
make install-target-libgcc

export PATH="$HOME/opt/cross/bin:$PATH"
