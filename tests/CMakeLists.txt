cmake_minimum_required(VERSION 3.10)

FILE(GLOB CXXPROGS *.cpp)

foreach(CXXFILE ${CXXPROGS})
  get_filename_component(EXENAME ${CXXFILE} NAME_WE)
  add_executable(${EXENAME} ${CXXFILE})
endforeach(CXXFILE)
