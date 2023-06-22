#include "test/test_package.hpp"

TEST(package_name, initialization)
{
    auto node = std::make_shared<PackageNode>();
    rclcpp::spin_some(node);
}

int main(int argc, char** argv)
{
    testing::InitGoogleTest(&argc, argv);
    rclcpp::init(argc, argv);
    auto result = RUN_ALL_TESTS();
    rclcpp::shutdown();
    return result;
}