cmake_minimum_required(VERSION 3.22)
project(package)

find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)

include_directories(SYSTEM /opt/ros/$ENV{ROS_DISTRO}/include)

add_executable(node src/main.cpp src/node.cpp)
ament_target_dependencies(node rclcpp std_msgs)
target_include_directories(node PRIVATE include)

if (BUILD_TESTING)
    find_package(ament_cmake_gtest REQUIRED)
    ament_add_gtest(${PROJECT_NAME}_test test/test_package.cpp src/node.cpp)
    target_include_directories(${PROJECT_NAME}_test PRIVATE include)
    ament_target_dependencies(${PROJECT_NAME}_test rclcpp std_msgs)
endif ()

install(TARGETS node DESTINATION lib/${PROJECT_NAME})

ament_package()