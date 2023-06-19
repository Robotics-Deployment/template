cmake_minimum_required(VERSION 3.22)
project(package)

find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)

add_executable(node src/main.cpp src/node.cpp)
ament_target_dependencies(node rclcpp std_msgs)
target_include_directories(
  node
  PRIVATE
    include
)

install(TARGETS
  node
  DESTINATION lib/${PROJECT_NAME}
)

ament_package()