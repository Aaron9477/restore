#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>

using namespace std;

int main(int argc, char** argv)
{
  ros::init(argc, argv, "image_publisher");
  ros::NodeHandle nh;
  image_transport::ImageTransport it(nh);
  image_transport::Publisher pub = it.advertise("/left/image_rect_color", 1);

  cv::Mat image = cv::imread(argv[1], CV_LOAD_IMAGE_COLOR);
  sensor_msgs::ImagePtr msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", image).toImageMsg();

  
  ros::Rate loop_rate(5);
  while (nh.ok()) {
    int subNumber = pub.getNumSubscribers();
    cout << "subNumer: " << subNumber << endl;
    pub.publish(msg);
    ros::spinOnce();
    loop_rate.sleep();
  }
}