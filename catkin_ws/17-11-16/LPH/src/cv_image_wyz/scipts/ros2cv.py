#!/usr/bin/env python
import rospy
import cv2
import cv2.cv as cv
import sys
from sensor_msgs.msg import Image, RegionOfInterest, CameraInfo
from cv_bridge import CvBridge, CvBridgeError
import numpy as np


class ROS2OpenCV2(object):
    def __init__(self, node_name):
        self.node_name = node_name
        self.resize_window_height = 0
        self.resize_window_width = 0

        rospy.init_node(node_name)
        rospy.loginfo("Starting node " + str(node_name))

        rospy.on_shutdown(self.cleanup)

        # Initialize a number of global variables
        self.frame = None
        self.display_image = None

        self.cv_image_pub = rospy.Publisher('/cv_image', Image)

        self.cv_window_name = self.node_name
        cv.NamedWindow(self.cv_window_name, cv.CV_WINDOW_NORMAL)
        if self.resize_window_height > 0 and self.resize_window_width > 0:
            cv.ResizeWindow(self.cv_window_name, self.resize_window_width, self.resize_window_height)
        else:
            cv.ResizeWindow(self.cv_window_name, 640, 480)

        # Create the cv_bridge object
        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber("/camera/rgb/image_raw", Image, self.image_callback)

    def image_callback(self, data):
        print 1111111111
        self.display_image = self.convert_image(data)
        cv2.imshow(self.node_name, self.display_image)
        cv2.waitKey(1)
        self.cv_image_pub.publish(self.display_image)



    def convert_image(self, ros_image):
        # Use cv_bridge() to convert the ROS image to OpenCV format
        try:
            cv_image = self.bridge.imgmsg_to_cv2(ros_image, "bgr8")
            return np.array(cv_image, dtype=np.uint8)
        except CvBridgeError, e:
            print e

    def cleanup(self):
        print "Shutting down"
        cv2.destroyAllWindows()


def main(args):
    try:
        node_name = "ros2opencv2"
        ROS2OpenCV2(node_name)
        rospy.spin()
    except KeyboardInterrupt:
        print "Shutting down ros2opencv node."
        cv.DestroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)








