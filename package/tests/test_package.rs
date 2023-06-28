use rclrs::Publisher;

fn assert_send<T: Send>() {}
fn assert_sync<T: Sync>() {}

#[test]
fn publisher_is_send_and_sync() {
    assert_send::<Publisher<test_msgs::msg::BoundedSequences>>();
    assert_sync::<Publisher<test_msgs::msg::BoundedSequences>>();
}