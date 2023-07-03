include_directories(${TEMPLATE_HDRS_DIR})

file(GLOB TEST_SRCS
  ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp
)

foreach(test_case ${TEST_SRCS})
  get_filename_component(fname ${test_case} NAME)
  get_filename_component(fname_we ${test_case} NAME_WE)
  add_executable(${fname_we} ${fname} ${TEST_SRCS})
  target_link_libraries(${fname_we}
    hello
  )
endforeach()
