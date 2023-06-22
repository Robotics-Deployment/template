#include "package/node.hpp"

using namespace std::chrono_literals;

PackageNode::PackageNode()
        : Node("node"), count_(0) {
    publisher_ = this->create_publisher<std_msgs::msg::String>("topic", 1);
    subscription_ = this->create_subscription<std_msgs::msg::String>(
            "topic", 1, [this](std_msgs::msg::String::SharedPtr msg) {
                subscription_callback(msg);
            });
    timer_ = this->create_wall_timer(
            500ms, [this]() { timer_callback(); });
}

void PackageNode::timer_callback() {
    auto message = std_msgs::msg::String();
    message.data = "Hello, world! " + std::to_string(count_++);
    RCLCPP_INFO(this->get_logger(), "Publishing: '%s'", message.data.c_str());
    publisher_->publish(message);
}

void PackageNode::subscription_callback(const std_msgs::msg::String::SharedPtr msg) {
    RCLCPP_INFO(this->get_logger(), "I heard: '%s'", msg->data.c_str());
}