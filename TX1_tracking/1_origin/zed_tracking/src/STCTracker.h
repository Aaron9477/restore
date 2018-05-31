// Fast object tracking algorithm  
// Author : zouxy  
// Date   : 2013-11-21  
// HomePage : http://blog.csdn.net/zouxy09  
// Email  : zouxy09@qq.com  
// Reference: Kaihua Zhang, et al. Fast Tracking via Spatio-Temporal Context Learning  
// HomePage : http://www4.comp.polyu.edu.hk/~cskhzhang/  
// Email: zhkhua@gmail.com   
#pragma once  


//standard includes
#include <stdio.h>
#include <string.h>
#include <ctime>
#include <chrono>

//opencv includes
#include <opencv2/opencv.hpp>

//ZED Includes
#include "sl/Camera.hpp"

#include "sl/Core.hpp"
#include "sl/defines.hpp"

using namespace cv;
using namespace std;


class STCTracker
{
public:
	STCTracker();
	~STCTracker();
	void init(const cv::Mat frame, const Rect box);
	void tracking(const cv::Mat frame, Rect &trackBox);

private:
	void createHammingWin();
	void complexOperation(const cv::Mat src1, const cv::Mat src2, cv::Mat &dst, int flag = 0);
	void getCxtPriorPosteriorModel(const cv::Mat image);
	void learnSTCModel(const cv::Mat image);

private:
	double sigma;           // scale parameter (variance)  
	double alpha;           // scale parameter  
	double beta;            // shape parameter  
	double rho;             // learning parameter  
	Point center;           // the object position  
	Rect cxtRegion;         // context region  

	cv::Mat cxtPriorPro;        // prior probability  
	cv::Mat cxtPosteriorPro;    // posterior probability  
	cv::Mat STModel;            // conditional probability  
	cv::Mat STCModel;           // spatio-temporal context model  
	cv::Mat hammingWin;         // Hamming window  
};
