param (
    [string]$directoryPath
)

# 创建目录函数
function New-DirectoryIfNotExist {
    param (
        [string]$path
    )
    if (-not (Test-Path $path)) {
        New-Item -ItemType Directory -Path $path | Out-Null
    }
}

# 创建目录
New-DirectoryIfNotExist -path $directoryPath
New-DirectoryIfNotExist -path "$directoryPath\src"
New-DirectoryIfNotExist -path "$directoryPath\include"
New-DirectoryIfNotExist -path "$directoryPath\lib"

# 创建CMakeLists.txt文件
$cmakeContent = @'
cmake_minimum_required(VERSION 3.29)

project(MyProject)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(fmt CONFIG REQUIRED)

list(APPEND INCLUDES
    ${PROJECT_SOURCE_DIR}/include
    ${VCPKG_INCLUDE_DIR}
)

list(APPEND COMPILE_OPTIONS 
    $<$<CXX_COMPILER_ID:MSVC>:/utf-8>
)

list(APPEND SOURCES 
    ${PROJECT_SOURCE_DIR}/src/main.cpp
)

list(APPEND LIBS
    fmt::fmt
)

add_executable(${PROJECT_NAME} ${SOURCES})
target_include_directories(${PROJECT_NAME} PRIVATE ${INCLUDES})
target_compile_options(${PROJECT_NAME} PRIVATE ${COMPILE_OPTIONS})
target_link_libraries(${PROJECT_NAME} PRIVATE ${LIBS})
'@

Set-Content -Path "$directoryPath\CMakeLists.txt" -Value $cmakeContent

# create main.cpp under $directoryPath\src
$mainCppContent = @'
#include <fmt/core.h>
#include <string>

int main(int argc, char *argv[])
{
    fmt::print("Hello, World!\n");
}
'@

Set-Content -Path "$directoryPath\src\main.cpp" -Value $mainCppContent


# 复制.clang-format文件
$clangFormatSource = ".\.clang-format"
$clangFormatDest = "$directoryPath\.clang-format"

if (Test-Path $clangFormatSource) {
    Copy-Item -Path $clangFormatSource -Destination $clangFormatDest
} else {
    Write-Warning ".clang-format file not found in the current directory."
}

# 复制 CMakePresets.json 文件
$cmakePresetsSource = ".\CMakePresets.json"
$cmakePresetsDest = "$directoryPath\CMakePresets.json"

if (Test-Path $cmakePresetsSource) {
    Copy-Item -Path $cmakePresetsSource -Destination $cmakePresetsDest
} else {
    Write-Warning "CMakePresets.json file not found in the current directory."
}
