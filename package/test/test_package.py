import rclpy

try:
    from ..package.node import MinimalPublisher
except ImportError:
    from package.node import MinimalPublisher

def test_initialization():
    minimal_publisher = MinimalPublisher()

    assert True

def setup_module(module):
    rclpy.init()


def teardown_module(module):
    rclpy.shutdown()