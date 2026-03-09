cmake_minimum_required(VERSION 3.10)
project(c_compiler LANGUAGES C)

#searching liblaries
find_package(FLEX REQUIRED)
find_package(BISON REQUIRED)

#local variables
set(SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)

#configurating bison
BISON_TARGET(MyParser ${SRC_DIR}/parser.y ${CMAKE_CURRENT_BINARY_DIR}/parser.tab.c)
FLEX_TARGET(MyTokenizer ${SRC_DIR}/tokenizer.l ${CMAKE_CURRENT_BINARY_DIR}/tokenizer.c)
ADD_FLEX_BISON_DEPENDENCY(MyTokenizer MyParser)

#creating exec
add_executable(c_compiler
    ${BISON_MyParser_OUTPUTS}
    ${FLEX_MyTokenizer_OUTPUTS}
)

#including directories
target_include_directories(c_compiler PRIVATE 
    ${CMAKE_CURRENT_BINARY_DIR} 
    ${SRC_DIR} 
    ${INCLUDE_DIR}
)

#changing exec location
set_target_properties(c_compiler PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin")

#linking
target_link_libraries(c_compiler ${FLEX_LIBRARIES})