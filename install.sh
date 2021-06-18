#!/bin/bash -e

TARGET_IPOPT_VERSION="3.12"
INSTALL_PREFIX="/usr/local"

GIT_BRANCH="stable/$TARGET_IPOPT_VERSION"
CLONE_DIR="$PWD/Ipopt-v$TARGET_IPOPT_VERSION"

apt-get update && apt-get install -y \
    gcc \
    g++ \
    gfortran \
    file \
    make \
    patch \
    git \
    wget \
    cppad

git clone \
  --recurse-submodules -j4 \
  -b $GIT_BRANCH \
  https://github.com/coin-or/Ipopt.git \
  "$CLONE_DIR"

cd "$CLONE_DIR"

echo "[ INFO ] Building Ipopt from ${CLONE_DIR}"
echo "[ INFO ] Saving headers and libraries to ${INSTALL_PREFIX}"

# BLAS
cd "$CLONE_DIR/ThirdParty/Blas"
./get.Blas
mkdir -p build && cd build
../configure --prefix=$INSTALL_PREFIX --disable-shared --with-pic
make -j4 install

# Lapack
cd "$CLONE_DIR/ThirdParty/Lapack"
./get.Lapack
mkdir -p build && cd build
../configure --prefix=$INSTALL_PREFIX --disable-shared --with-pic \
  --with-blas="$INSTALL_PREFIX/lib/libcoinblas.a -lgfortran"
make -j4 install

# ASL
cd "$CLONE_DIR/ThirdParty/ASL"
./get.ASL

# MUMPS
cd "$CLONE_DIR/ThirdParty/Mumps"
./get.Mumps

# Build everything
cd "$CLONE_DIR"
./configure --prefix=$INSTALL_PREFIX coin_skip_warn_cxxflags=yes \
  --with-blas="$INSTALL_PREFIX/lib/libcoinblas.a -lgfortran" \
  --with-lapack=$INSTALL_PREFIX/lib/libcoinlapack.a
make -j4
make test
make -j1 install

echo "[ INFO ] Ipopt-v${TARGET_IPOPT_VERSION} installation complete"
exit 0
