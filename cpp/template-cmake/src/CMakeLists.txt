set(TEMLATE_HDRS_DIR ${CMAKE_CURRENT_SOURCE_DIR} PARENT_SCOPE)
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

file(GLOB TEMPLATE_SRCS
  ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp
)

add_library(hello SHARED ${TEMPLATE_SRCS} ${TEMPLATE_HDRS_DIR} ${TEMPLATE_LINK_LIBS})
#set_property(TARGET hello PROPERTY CUDA_SEPARABLE_COMPILATION ON)