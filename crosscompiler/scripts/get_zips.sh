#!/bin/bash

GCC_VERSION=5.4.0
BINUTILS_VERSION=2.29.1

GCC_URL="https://ftp.gnu.org/gnu/gcc/gcc-$GCC_VERSION/gcc-$GCC_VERSION.tar.gz"
BINUTILS_URL="https://ftp.gnu.org/gnu/binutils/binutils-$BINUTILS_VERSION.tar.gz"
wget -nc -P ./zips/ $GCC_URL
#mv ../zips/gcc-$GCC_VERSION.tar.gz ../zips/gcc.tar.gz
wget -nc -P ./zips/ $BINUTILS_URL
#mv ../zips/binutils-$BINUTILS_VERSION.tar.gz ../zips/binutils.tar.gz
