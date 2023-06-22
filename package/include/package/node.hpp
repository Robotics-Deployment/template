#pragma once

#include <chrono>
#include <string>
#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"

class PackageNode : public rclcpp::Node
{
public:
  PackageNode();

private:
  void timer_callback();
  void subscription_callback(std_msgs::msg::String::SharedPtr msg);

  rclcpp::TimerBase::SharedPtr timer_;
  rclcpp::Publisher<std_msgs::msg::String>::SharedPtr publisher_;
  rclcpp::Subscription<std_msgs::msg::String>::SharedPtr subscription_;
  size_t count_;
};
