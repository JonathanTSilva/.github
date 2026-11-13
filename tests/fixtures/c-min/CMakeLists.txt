cmake_minimum_required(VERSION 3.20)
project(c_min LANGUAGES C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

enable_testing()

add_library(sum src/sum.c)
target_include_directories(sum PUBLIC src)
target_compile_options(sum PRIVATE -Wall -Wextra -Werror)

add_executable(sum_test tests/sum_test.c)
target_link_libraries(sum_test PRIVATE sum)
target_compile_options(sum_test PRIVATE -Wall -Wextra -Werror)
add_test(NAME sum COMMAND sum_test)
