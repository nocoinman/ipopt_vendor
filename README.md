# ipopt_vendor

[![Build](https://github.com/nocoinman/ipopt_vendor/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/nocoinman/ipopt_vendor/actions/workflows/build-and-test.yml)
[![Docker image](https://github.com/nocoinman/ipopt_vendor/actions/workflows/docker-image.yml/badge.svg)](https://github.com/nocoinman/ipopt_vendor/actions/workflows/docker-image.yml)
[![Ipopt version](https://img.shields.io/badge/Ipopt%20-v3%2E12-blue.svg)](https://img.shields.io/badge/Ipopt%20-v3%2E12-blue.svg)

Vendor package for working with COIN-OR/Ipopt, provides a minimal debian based container to work with CppAD + Ipopt

---

## Local Ipopt installation

```bash
git clone https://github.com/nocoinman/ipopt_vendor.git
cd ipopt_vendor
sudo ./install.sh
sudo ldconfig
```

## Check installation

- Compile and run samples

```bash
cd ipopt_vendor/testing
make test
```

## Using docker image

```bash
docker pull ghcr.io/nocoinman/ipopt-cxx-suite:latest
```
