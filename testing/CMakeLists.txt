cmake_minimum_required(VERSION 3.12)
project(ipopt_vendor_testing)

find_package(PkgConfig REQUIRED)
pkg_check_modules(CPPAD REQUIRED cppad)
pkg_check_modules(IPOPT REQUIRED ipopt>=3.12)

enable_testing()

find_package(GTest REQUIRED)
find_package(Threads REQUIRED)

include_directories(${GTEST_INCLUDE_DIR})

file(GLOB_RECURSE SOURCES *.cpp)
set(SOURCES ${SOURCES})

add_executable(run_tests ${SOURCES})
target_link_libraries(run_tests gtest gtest_main pthread ${IPOPT_LIBRARIES})
add_test(run_tests run_tests)
