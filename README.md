# ipopt_vendor

[![Build and Test](https://github.com/nocoinman/ipopt_vendor/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/nocoinman/ipopt_vendor/actions/workflows/build-and-test.yml)
![Ipopt version](https://img.shields.io/badge/Ipopt%20-v3%2E12-blue.svg)

Vendor package for working with COIN-OR/Ipopt

---

## Installation

```bash
git clone https://github.com/nocoinman/ipopt_vendor.git
cd ipopt_vendor
sudo ./install.sh
sudo ldconfig
```

## Check installation

- Install googletest

```bash
sudo apt-get install -y libgtest-dev
```

- Compile and run samples

```bash
cd ipopt_vendor
mkdir build && cd build
cmake ../testing
make
./run_tests
```
