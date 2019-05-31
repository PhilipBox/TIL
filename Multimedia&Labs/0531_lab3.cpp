#include <iostream>
#include <string>
#include <stdio.h>
#include <math.h>
#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>

using namespace cv;
using namespace std;

int main()
{
    Mat img0, img1, map;
    
    string imageName("/Users/philip/left.png");
    
    Mat3b input = imread(imageName.c_str(), IMREAD_COLOR);
    
    img0 = imread("/Users/philip/left.png");;
    img1 = imread("/Users/philip/right.png");;
    
    cvtColor(img0, img0, COLOR_BGR2GRAY);
    cvtColor(img1, img1, COLOR_BGR2GRAY);
    
    map = Mat::zeros(img0.rows, img0.cols, img0.type());
    
    float sum = 0, min = -1;
    int d=0;
    
    for (int i = 0; i < img0.rows - 10; i++) {
        for (int j = 0; j < img0.cols - 10; j++) {
            
            for (int pass = 0; pass < img0.cols - 10 - j; pass++) { // scan to right
                if (pass > 25)
                    break;
                
                for (int s = 0; s < 10; s++) { // window size = 5
                    for (int t = 0; t < 10; t++) {
                        sum += abs(img1.at<uchar>(i + s, j + t) - img0.at<uchar>(i + s, j + t + pass));
                    }
                }
                sum /= 25;
                if (min == -1) { // first, set min value
                    min = sum;
                    d = pass;
                }
                if (min > sum) { // check min value
                    min = sum;
                    d = pass;
                }
                
            }
            sum = 0;
            min = -1;
            map.at<uchar>(i, j) = saturate_cast<uchar>(d * 15);
        }
    }
    
    imshow("Left", img0);
    imshow("Right", img1);
    imshow("Result", map);
    
    waitKey(0);
    return 0;
}
