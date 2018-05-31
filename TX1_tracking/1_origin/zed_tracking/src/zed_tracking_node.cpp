//standard includes
#include <csignal>
#include <cstdio>
#include <math.h>
#include <limits>
#include <thread>
#include <chrono>
#include <memory>
#include <sys/stat.h> // file exists

//ROS includes
#include <ros/ros.h>
#include <nodelet/nodelet.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/CameraInfo.h>
#include <sensor_msgs/distortion_models.h>
#include <sensor_msgs/image_encodings.h>
#include <image_transport/image_transport.h>
#include <dynamic_reconfigure/server.h>
#include <nav_msgs/Odometry.h>
#include <tf2/LinearMath/Quaternion.h>
#include <tf2_ros/transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>

#include <cv_bridge/cv_bridge.h>

//opencv includes
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/calib3d/calib3d.hpp>

//Boost includes
#include <boost/make_shared.hpp>

//ZED Includes
#include <sl/Camera.hpp>

//msg
#include <zed_tracking/Box.h>

#include "STCTracker.h"

using namespace std;
using namespace sl;

Rect box;
Rect box2;
cv::Mat image_pad;

//bool drawing_box = false;
bool gotBB = false;
bool isInitTracker = false;
bool SAVE = false;
string outFlie = "/media/Ubuntu/Jetson/LJX/saveImage/";

//initBoxCallback func
void initBoxCallback(const zed_tracking::Box &initbox_msg){
	gotBB = true;

	box.x = initbox_msg.x;
	box.y = initbox_msg.y;
	box.height = initbox_msg.height;
	box.width = initbox_msg.width;

	ROS_INFO_STREAM("get the initBox, start Tracking!");
	ROS_INFO_STREAM("initBox.x = " << initbox_msg.x);
	ROS_INFO_STREAM("initBox.y = " << initbox_msg.y);
	ROS_INFO_STREAM("initBox.height = " << initbox_msg.height);
	ROS_INFO_STREAM("initBox.width = " << initbox_msg.width);
}
/* \brief Image to ros message conversion 
 * \param img : the image to publish
 * \param encodingType : the sensor_msgs::image_encodings encoding type
 * \param frameId : the id of the reference frame of the image
 * \param t : the ros::Time to stamp the image
*/
sensor_msgs::ImagePtr imageToROSmsg(cv::Mat img, const std::string encodingType, std::string frameId, ros::Time t){
    sensor_msgs::ImagePtr ptr = boost::make_shared<sensor_msgs::Image>();
    sensor_msgs::Image& imgMessage = *ptr;
    imgMessage.header.stamp = t;
    imgMessage.header.frame_id = frameId;
    imgMessage.height = img.rows;
    imgMessage.width = img.cols;
    imgMessage.encoding = encodingType;
    int num = 1; //for endianness detection
    imgMessage.is_bigendian = !(*(char *)&num == 1);
    imgMessage.step = img.cols * img.elemSize();
    size_t size = imgMessage.step * img.rows;
    imgMessage.data.resize(size);

    if (img.isContinuous())
        memcpy((char*)(&imgMessage.data[0]), img.data, size);
    else {
        uchar* opencvData = img.data;
        uchar* rosData = (uchar*)(&imgMessage.data[0]);
        for (unsigned int i = 0; i < img.rows; i++) {
            memcpy(rosData, opencvData, imgMessage.step);
            rosData += imgMessage.step;
            opencvData += img.step;
        }
    }
    return ptr;
}

cv::Mat slMat2cvMat(sl::Mat& input)
{

	//convert MAT_TYPE to CV_TYPE
	int cv_type = -1;
	switch (input.getDataType())
	{
	case sl::MAT_TYPE_32F_C1: cv_type = CV_32FC1; break;
	case sl::MAT_TYPE_32F_C2: cv_type = CV_32FC2; break;
	case sl::MAT_TYPE_32F_C3: cv_type = CV_32FC3; break;
	case sl::MAT_TYPE_32F_C4: cv_type = CV_32FC4; break;
	case sl::MAT_TYPE_8U_C1: cv_type = CV_8UC1; break;
	case sl::MAT_TYPE_8U_C2: cv_type = CV_8UC2; break;
	case sl::MAT_TYPE_8U_C3: cv_type = CV_8UC3; break;
	case sl::MAT_TYPE_8U_C4: cv_type = CV_8UC4; break;
	default: break;
	}

	// cv::Mat data requires a uchar* pointer. Therefore, we get the uchar1 pointer from sl::Mat (getPtr<T>())
	//cv::Mat and sl::Mat will share the same memory pointer
	return cv::Mat(input.getHeight(), input.getWidth(), cv_type, input.getPtr<sl::uchar1>(MEM_CPU));

}
/* \brief Publish a cv::Mat image with a ros Publisher
 * \param img : the image to publish
 * \param pub_img : the publisher object to use
 * \param img_frame_id : the id of the reference frame of the image
 * \param t : the ros::Time to stamp the image
 */

void publishImage(cv::Mat img, image_transport::Publisher &pub_img, string img_frame_id, ros::Time t) {
    pub_img.publish(imageToROSmsg(img
                                , sensor_msgs::image_encodings::BGR8
                                , img_frame_id
                                , t ));
}

/* \brief Publish the pose of the camera with a ros Publisher
 * \param pose : the 4x4 matrix representing the camera pose
 * \param pub_odom : the publisher object to use
 * \param odom_frame_id : the id of the reference frame of the pose
 * \param t : the ros::Time to stamp the image
 */
void publishOdom(sl::Pose pose, ros::Publisher &pub_odom, string odom_frame_id, ros::Time t) {
    nav_msgs::Odometry odom;
    odom.header.stamp = t;
    odom.header.frame_id = odom_frame_id;
    //odom.child_frame_id = "zed_optical_frame";
    sl::Translation translation = pose.getTranslation();
    odom.pose.pose.position.x = translation(2);
    odom.pose.pose.position.y = -translation(0);
    odom.pose.pose.position.z = -translation(1);
    sl::Orientation quat = pose.getOrientation();
    odom.pose.pose.orientation.x = quat(2);
    odom.pose.pose.orientation.y = -quat(0);
    odom.pose.pose.orientation.z = -quat(1);
    odom.pose.pose.orientation.w = quat(3);
    pub_odom.publish(odom);
}
/* \brief Publish the pose of the camera as a transformation
 * \param pose : the 4x4 matrix representing the camera pose
 * \param trans_br : the TransformBroadcaster object to use
 * \param odometry_transform_frame_id : the id of the transformation
 * \param t : the ros::Time to stamp the image
 */
void publishTrackedFrame(sl::Pose pose, tf2_ros::TransformBroadcaster &trans_br, string odometry_transform_frame_id, ros::Time t) {

    geometry_msgs::TransformStamped transformStamped;
    transformStamped.header.stamp = ros::Time::now();
    transformStamped.header.frame_id = "zed_initial_frame";
    transformStamped.child_frame_id = odometry_transform_frame_id;
    sl::Translation translation = pose.getTranslation();
    transformStamped.transform.translation.x = translation(2);
    transformStamped.transform.translation.y = -translation(0);
    transformStamped.transform.translation.z = -translation(1);
    sl::Orientation quat = pose.getOrientation();
    transformStamped.transform.rotation.x = quat(2);
    transformStamped.transform.rotation.y = -quat(0);
    transformStamped.transform.rotation.z = -quat(1);
    transformStamped.transform.rotation.w = quat(3);
    trans_br.sendTransform(transformStamped);
}


int main(int argc, char **argv) {

	/************************ZED************************/
	// Create a ZED camera object
    	Camera zed;
		
    	// Set configuration parameters
		int rate = 25;
    	InitParameters init_params;
    	init_params.camera_resolution = RESOLUTION_HD720;
		init_params.camera_fps = rate;
    	init_params.depth_mode = DEPTH_MODE_PERFORMANCE;
    	init_params.coordinate_units = sl::UNIT_METER;

    	// Open the camera
    	ERROR_CODE err = zed.open(init_params);
        //sl::ERROR_CODE err = sl::ERROR_CODE_CAMERA_NOT_DETECTED;
        while (err != sl::SUCCESS) {
            //err = zed->open(param); // Try to initialize the ZED
			err = zed.open(init_params);
            //NODELET_INFO_STREAM(errorCode2str(err));
			cout << errorCode2str(err) << endl;
            std::this_thread::sleep_for(std::chrono::milliseconds(2000));
        }
    	//if (err != SUCCESS)
        	//return 1;
      

    	// Set runtime parameters after opening the camera
    	RuntimeParameters runtime_parameters;
    	runtime_parameters.sensing_mode = SENSING_MODE_STANDARD; // Use STANDARD sensing mode

    	// Create sl and cv Mat to get ZED left image and depth image
    	// Best way of sharing sl::Mat and cv::Mat :
    	// Create a sl::Mat and then construct a cv::Mat using the ptr to sl::Mat data.
    	Resolution image_size = zed.getResolution();

    	sl::Mat image_zed(image_size,sl::MAT_TYPE_8U_C4); // Create a sl::Mat to handle Left image
        cv::Mat image_ocv = slMat2cvMat(image_zed);
        sl::Mat depth_image_zed(image_size, MAT_TYPE_8U_C4);
        cv::Mat depth_image_ocv = slMat2cvMat(depth_image_zed);

    	// Create OpenCV images to display (lower resolution to fit the screen)
		int width = 720;
		int height = 404;
    	cv::Size displaySize(width, height);
    	cv::Mat image_ocv_display(displaySize, CV_8UC4);
    	cv::Mat depth_image_ocv_display(displaySize, CV_8UC4);

		//depth
		sl::Mat depth;

	
		//get parameters
		sl::CameraInformation zedParam = zed.getCameraInformation();
		float baseline = zedParam.calibration_parameters.T[0] * 0.001; // baseline converted in meters

		float fx = zedParam.calibration_parameters.left_cam.fx;
		float fy = zedParam.calibration_parameters.left_cam.fy;
		float cx = zedParam.calibration_parameters.left_cam.cx;
		float cy = zedParam.calibration_parameters.left_cam.cy;

    	// Give a name to OpenCV Windows
		//cv::namedWindow("Image", cv::WINDOW_AUTOSIZE);//
		//cvSetMouseCallback("Image", mouseHandler, NULL);
	

		// Jetson only. Execute the calling thread on 2nd core
    	Camera::sticktoCPUCore(2);
	
		/**************************ROS***************************/
		ros::init(argc, argv, "zed_tracking");
		//int rate = 30;
		ros::NodeHandle nh;

		// Create all the publishers
		// Image publishers
		image_transport::ImageTransport it_zed(nh);
		image_transport::Publisher pub_left = it_zed.advertise("/left/image_rect_color", 1); //left
		sensor_msgs::ImagePtr frame_msg;

    	// Create all the subscribers
    	ros::Subscriber sub_initBox = nh.subscribe("/init_box", 1, initBoxCallback);

		ros::Rate loop_rate(rate);

		//odom
		//Odometry publisher
		ros::Publisher pub_odom;
		string odometry_topic = "odom";
        pub_odom = nh.advertise<nav_msgs::Odometry>(odometry_topic, 1);
        //Tracking variables
        sl::Pose pose;
		//tf
		tf2_ros::TransformBroadcaster transform_odom_broadcaster;
		std::string odometry_frame_id;
        std::string odometry_transform_frame_id;
		odometry_frame_id = "/zed_initial_frame";
		odometry_transform_frame_id = "/zed_current_frame";
		
		sl::TrackingParameters trackParams;

		publishTrackedFrame(pose, transform_odom_broadcaster, odometry_transform_frame_id, ros::Time::now());//publish the tracked Frame
		zed.enableTracking(trackParams);//Start the odom tracking
		/**************************Tracker***************************/
		//declared stcTracker
		STCTracker stcTracker;
		int frameCount = 0;
		float last_dist = 0;
		char key = ' ';

		// Main loop
		while (ros::ok()) {
			//odom 
			// Publish the odometry if someone has subscribed to
			ros::Time t = ros::Time::now(); // Get current time
			
			zed.getPosition(pose);
			publishOdom(pose, pub_odom, odometry_frame_id, t);
			//Note, the frame is published, but its values will only change if someone has subscribed to odom
			publishTrackedFrame(pose, transform_odom_broadcaster, odometry_transform_frame_id, t); //publish the tracked Frame

			//object tracking
			if(!gotBB){
				if (zed.grab(runtime_parameters) == SUCCESS) {	
					zed.retrieveImage(image_zed, VIEW_LEFT); // Retrieve the left image
					cv::resize(image_ocv, image_ocv_display, displaySize);

					frame_msg = cv_bridge::CvImage(std_msgs::Header(), "bgra8", image_ocv_display).toImageMsg();
					pub_left.publish(frame_msg);//publish images
					cv::waitKey(1);
				}
			}
			else{
				if(!isInitTracker){
					isInitTracker = true;
					copyMakeBorder(image_ocv_display, image_pad, 2 * box.height, 2 * box.height, 2 * box.width, 2 * box.width, BORDER_REPLICATE, Scalar(0));

					box2.height = box.height;
					box2.width = box.width;
					box2.x = box.x + 2 * box.width;
					box2.y = box.y + 2 * box.height;

					//init tracker
				
					stcTracker.init(image_pad, box2);
				}
			
				if (zed.grab(runtime_parameters) == SUCCESS) {
					double t1 = (double)cvGetTickCount();
			
					zed.retrieveImage(image_zed, VIEW_LEFT); // Retrieve the left image
					cv::resize(image_ocv, image_ocv_display, displaySize);

					zed.retrieveImage(depth_image_zed, VIEW_DEPTH); //Retrieve the depth view (image)
					cv::resize(depth_image_ocv, depth_image_ocv_display, displaySize);
			
					zed.retrieveMeasure(depth, MEASURE_DEPTH); // Retrieve the depth measure (32bits)

					t1 = (double)cvGetTickCount() - t1;//
					cout << "t1: " << t1 / ((double)cvGetTickFrequency()*1000.) << endl;

					//Tracking
					double t = (double)cvGetTickCount();
					frameCount++;
					cv::Mat image_pad2;
					copyMakeBorder(image_ocv_display, image_pad2, 2 * box.height, 2 * box.height, 2 * box.width, 2 * box.width, BORDER_REPLICATE, Scalar(0));
					stcTracker.tracking(image_pad2, box2);

					//compute depth
					int center_y = box.y;//
					int center_x = box.x;// 
					float sum_dist=0.0, min_dist=50000.0;
					int i=0, j=0, number=0;
					int y_int, x_int;

					for(j=0; j < 9; ++j)
					{
						y_int = (center_y * depth.getHeight() / displaySize.height);//

						for(i=0; i < 9; ++i)
						{
							x_int = (center_x * depth.getWidth() / displaySize.width);
							sl::float1 dist;
							depth.getValue(x_int, y_int, &dist);

							if(dist < min_dist)//get min distance
								min_dist = dist;

							center_x += 0.125*box.width;
						}
						center_y += 0.125*box.height;
					}
					//min_dist = min_dist / 1000.f;

					//draw rectangle
					box.height = box2.height;
					box.width = box2.width;
					box.x = box2.x - 2 * box.width;
					box.y = box2.y - 2 * box.height;
	
					rectangle(image_ocv_display, cvPoint(box.x, box.y), cvPoint(box.x+box.width,box.y+box.height),Scalar(0, 0, 255), 2);
					rectangle(depth_image_ocv_display, cvPoint(box.x, box.y), cvPoint(box.x+box.width,box.y+box.height),Scalar(0, 0, 255), 2);
					//draw circle on frame
					circle(image_ocv_display, Point(width/2, height/2), 4, Scalar(0, 255, 0), 4);
					circle(depth_image_ocv_display, Point(width/2, height/2), 4, Scalar(0, 255, 0), 4);

					// show the number of frame  
					stringstream buf;
					buf << frameCount;
					string num = buf.str();
					putText(image_ocv_display, num, Point(10, 30), FONT_HERSHEY_SIMPLEX, 0.6, Scalar(0, 0, 255), 2);
					putText(depth_image_ocv_display, num, Point(10, 30), FONT_HERSHEY_SIMPLEX, 0.6, Scalar(0, 0, 255), 2);

					//computer  world coordinate
					center_x = (box.x + (box.width >> 1)) * depth.getWidth() / displaySize.width;
					center_y = (box.y + (box.height >> 1)) * depth.getHeight() / displaySize.height;
					float xx = ((center_x-cx) * min_dist)/(fx);
					float yy = -((center_y-cy) * min_dist)/(fy);

					stringstream buf_2;
					buf_2 << '(' << xx << ',' << yy << ',' << min_dist << ')';
					string num_2 = buf_2.str();
					putText(image_ocv_display, num_2, Point(10, 60), FONT_HERSHEY_SIMPLEX, 0.6, Scalar(0, 255, 0), 2);

					//publish images
					frame_msg = cv_bridge::CvImage(std_msgs::Header(), "bgra8", image_ocv_display).toImageMsg();
					pub_left.publish(frame_msg);
					//cv::imshow("Image", image_ocv_display);//
					//imshow("Depth", depth_image_ocv_display);

					if(SAVE){
						imwrite(outFlie + num + ".jpg", image_ocv_display);
						imwrite(outFlie + "_disp" + num + ".jpg", depth_image_ocv_display);
					}

					key = cv::waitKey(1);
				}

			}
			ros::spinOnce();
			loop_rate.sleep();
		} 
    return 0;
}





