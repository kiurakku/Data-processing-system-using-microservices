cmake_minimum_required(VERSION 3.10)
project(DataProcessor)

set(CMAKE_CXX_STANDARD 14)

find_package(cpprestsdk REQUIRED)

add_executable(data-processor main.cpp)
target_link_libraries(data-processor PRIVATE cpprestsdk::cpprest)