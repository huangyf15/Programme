cmake_minimum_required(VERSION 3.10)
project(cmake_cpp_template LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 11)

#CUDA_CONFIG
# enable_language(CUDA)
# set(CMAKE_CUDA_STANDARD 11)
# set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -maxrregcount 0")
# include_directories(${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES})
# if (POLICY CMP0104)
#   cmake_policy(SET CMP0104 OLD)
# endif ()

message(STATUS ${CMAKE_BUILD_TYPE})

include_directories(${PROJECT_SOURCE_DIR}/include)
add_subdirectory(${PROJECT_SOURCE_DIR}/src)

#build tests
add_subdirectory(${PROJECT_SOURCE_DIR}/test)