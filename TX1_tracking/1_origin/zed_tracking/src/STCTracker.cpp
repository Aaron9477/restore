// Fast object tracking algorithm  
// Author : zouxy  
// Date   : 2013-11-21  
// HomePage : http://blog.csdn.net/zouxy09  
// Email  : zouxy09@qq.com  
// Reference: Kaihua Zhang, et al. Fast Tracking via Spatio-Temporal Context Learning  
// HomePage : http://www4.comp.polyu.edu.hk/~cskhzhang/  
// Email: zhkhua@gmail.com   

#include "STCTracker.h"  

STCTracker::STCTracker()
{

}

STCTracker::~STCTracker()
{

}

/************ Create a Hamming window ********************/
void STCTracker::createHammingWin()
{
	for (int i = 0; i < hammingWin.rows; i++)
	{
		for (int j = 0; j < hammingWin.cols; j++)
		{
			hammingWin.at<double>(i, j) = (0.54 - 0.46 * cos(2 * CV_PI * i / hammingWin.rows))
				* (0.54 - 0.46 * cos(2 * CV_PI * j / hammingWin.cols));
		}
	}
}

/************ Define two complex-value operation *****************/
void STCTracker::complexOperation(const cv::Mat src1, const cv::Mat src2, cv::Mat &dst, int flag)
{
	CV_Assert(src1.size == src2.size);
	CV_Assert(src1.channels() == 2);

	cv::Mat A_Real, A_Imag, B_Real, B_Imag, R_Real, R_Imag;
	vector<cv::Mat> planes;
	split(src1, planes);
	planes[0].copyTo(A_Real);
	planes[1].copyTo(A_Imag);

	split(src2, planes);
	planes[0].copyTo(B_Real);
	planes[1].copyTo(B_Imag);

	dst.create(src1.rows, src1.cols, CV_64FC2);
	split(dst, planes);
	R_Real = planes[0];
	R_Imag = planes[1];

	for (int i = 0; i < A_Real.rows; i++)
	{
		for (int j = 0; j < A_Real.cols; j++)
		{
			double a = A_Real.at<double>(i, j);
			double b = A_Imag.at<double>(i, j);
			double c = B_Real.at<double>(i, j);
			double d = B_Imag.at<double>(i, j);

			if (flag)
			{
				// division: (a+bj) / (c+dj)  
				R_Real.at<double>(i, j) = (a * c + b * d) / (c * c + d * d + 0.000001);
				R_Imag.at<double>(i, j) = (b * c - a * d) / (c * c + d * d + 0.000001);
			}
			else
			{
				// multiplication: (a+bj) * (c+dj)  
				R_Real.at<double>(i, j) = a * c - b * d;
				R_Imag.at<double>(i, j) = b * c + a * d;
			}
		}
	}
	merge(planes, dst);
}

/************ Get context prior and posterior probability ***********/
void STCTracker::getCxtPriorPosteriorModel(const cv::Mat image)
{
	CV_Assert(image.size == cxtPriorPro.size);

	double sum_prior(0), sum_post(0);
	for (int i = 0; i < cxtRegion.height; i++)
	{
		for (int j = 0; j < cxtRegion.width; j++)
		{
			double x = j + cxtRegion.x;
			double y = i + cxtRegion.y;
			double dist = sqrt((center.x - x) * (center.x - x) + (center.y - y) * (center.y - y));

			// equation (5) in the paper  
			cxtPriorPro.at<double>(i, j) = exp(-dist * dist / (2 * sigma * sigma));
			sum_prior += cxtPriorPro.at<double>(i, j);

			// equation (6) in the paper  
			cxtPosteriorPro.at<double>(i, j) = exp(-pow(dist / sqrt(alpha), beta));
			sum_post += cxtPosteriorPro.at<double>(i, j);
		}
	}
	cxtPriorPro.convertTo(cxtPriorPro, -1, 1.0 / sum_prior);
	cxtPriorPro = cxtPriorPro.mul(image);
	cxtPosteriorPro.convertTo(cxtPosteriorPro, -1, 1.0 / sum_post);
}

/************ Learn Spatio-Temporal Context Model ***********/
void STCTracker::learnSTCModel(const cv::Mat image)
{
	// step 1: Get context prior and posterior probability  
	getCxtPriorPosteriorModel(image);

	// step 2-1: Execute 2D DFT for prior probability  
	cv::Mat priorFourier;
	cv::Mat planes1[] = { cxtPriorPro, cv::Mat::zeros(cxtPriorPro.size(), CV_64F) };
	merge(planes1, 2, priorFourier);
	dft(priorFourier, priorFourier);

	// step 2-2: Execute 2D DFT for posterior probability  
	cv::Mat postFourier;
	cv::Mat planes2[] = { cxtPosteriorPro, cv::Mat::zeros(cxtPosteriorPro.size(), CV_64F) };
	merge(planes2, 2, postFourier);
	dft(postFourier, postFourier);

	// step 3: Calculate the division  
	cv::Mat conditionalFourier;
	complexOperation(postFourier, priorFourier, conditionalFourier, 1);

	// step 4: Execute 2D inverse DFT for conditional probability and we obtain STModel  
	dft(conditionalFourier, STModel, DFT_INVERSE | DFT_REAL_OUTPUT | DFT_SCALE);

	// step 5: Use the learned spatial context model to update spatio-temporal context model  
	addWeighted(STCModel, 1.0 - rho, STModel, rho, 0.0, STCModel);
}

/************ Initialize the hyper parameters and models ***********/
void STCTracker::init(const cv::Mat frame, const Rect box)
{
	// initial some parameters  
	alpha = 2.25;
	beta = 1;
	rho = 0.075;
	sigma = 0.5 * (box.width + box.height);

	// the object position  
	center.x = box.x + 0.5 * box.width;
	center.y = box.y + 0.5 * box.height;

	// the context region  
	cxtRegion.width = 2 * box.width;
	cxtRegion.height = 2 * box.height;
	cxtRegion.x = center.x - cxtRegion.width * 0.5;
	cxtRegion.y = center.y - cxtRegion.height * 0.5;
	cxtRegion &= Rect(0, 0, frame.cols, frame.rows);

	// the prior, posterior and conditional probability and spatio-temporal context model  
	cxtPriorPro = cv::Mat::zeros(cxtRegion.height, cxtRegion.width, CV_64FC1);
	cxtPosteriorPro = cv::Mat::zeros(cxtRegion.height, cxtRegion.width, CV_64FC1);
	STModel = cv::Mat::zeros(cxtRegion.height, cxtRegion.width, CV_64FC1);
	STCModel = cv::Mat::zeros(cxtRegion.height, cxtRegion.width, CV_64FC1);

	// create a Hamming window  
	hammingWin = cv::Mat::zeros(cxtRegion.height, cxtRegion.width, CV_64FC1);
	createHammingWin();

	cv::Mat gray;
	cvtColor(frame, gray, CV_RGB2GRAY);

	// normalized by subtracting the average intensity of that region  
	Scalar average = mean(gray(cxtRegion));
	cv::Mat context;
	gray(cxtRegion).convertTo(context, CV_64FC1, 1.0, -average[0]);

	// multiplies a Hamming window to reduce the frequency effect of image boundary  
	context = context.mul(hammingWin);

	// learn Spatio-Temporal context model from first frame  
	learnSTCModel(context);
}

/******** STCTracker: calculate the confidence map and find the max position *******/
void STCTracker::tracking(const cv::Mat frame, Rect &trackBox)
{
	cv::Mat gray;
	cvtColor(frame, gray, CV_RGB2GRAY);

	// normalized by subtracting the average intensity of that region  
	Scalar average = mean(gray(cxtRegion));
	cv::Mat context;
	gray(cxtRegion).convertTo(context, CV_64FC1, 1.0, -average[0]);

	// multiplies a Hamming window to reduce the frequency effect of image boundary  
	context = context.mul(hammingWin);

	// step 1: Get context prior probability  
	getCxtPriorPosteriorModel(context);

	// step 2-1: Execute 2D DFT for prior probability  
	cv::Mat priorFourier;
	cv::Mat planes1[] = { cxtPriorPro, cv::Mat::zeros(cxtPriorPro.size(), CV_64F) };
	merge(planes1, 2, priorFourier);
	dft(priorFourier, priorFourier);

	// step 2-2: Execute 2D DFT for conditional probability  
	cv::Mat STCModelFourier;
	cv::Mat planes2[] = { STCModel, cv::Mat::zeros(STCModel.size(), CV_64F) };
	merge(planes2, 2, STCModelFourier);
	dft(STCModelFourier, STCModelFourier);

	// step 3: Calculate the multiplication  
	cv::Mat postFourier;
	complexOperation(STCModelFourier, priorFourier, postFourier, 0);

	// step 4: Execute 2D inverse DFT for posterior probability namely confidence map  
	cv::Mat confidenceMap;
	dft(postFourier, confidenceMap, DFT_INVERSE | DFT_REAL_OUTPUT | DFT_SCALE);

	// step 5: Find the max position  
	Point point;
	minMaxLoc(confidenceMap, 0, 0, 0, &point);

	// step 6-1: update center, trackBox and context region  
	center.x = cxtRegion.x + point.x;
	center.y = cxtRegion.y + point.y;
	trackBox.x = center.x - 0.5 * trackBox.width;
	trackBox.y = center.y - 0.5 * trackBox.height;
	trackBox &= Rect(0, 0, frame.cols, frame.rows);

	cxtRegion.x = center.x - cxtRegion.width * 0.5;
	cxtRegion.y = center.y - cxtRegion.height * 0.5;
	cxtRegion &= Rect(0, 0, frame.cols, frame.rows);

	// step 7: learn Spatio-Temporal context model from this frame for tracking next frame  
	average = mean(gray(cxtRegion));
	gray(cxtRegion).convertTo(context, CV_64FC1, 1.0, -average[0]);
	context = context.mul(hammingWin);
	learnSTCModel(context);
}
