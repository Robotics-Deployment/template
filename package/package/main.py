
import rclpy

try:
    from node import MinimalPublisher
except ImportError:
    from package.node import MinimalPublisher

def main(args=None):
    rclpy.init(args=args)

    minimal_publisher = MinimalPublisher()

    rclpy.spin(minimal_publisher)

    rclpy.shutdown()


if __name__ == '__main__':
    main()