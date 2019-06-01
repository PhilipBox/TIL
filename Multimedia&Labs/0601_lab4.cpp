#include "opencv2/opencv.hpp"
#include <iostream>

using namespace cv;
using namespace cv::dnn;
using namespace std;

const String model = "res10_300x300_ssd_iter_140000_fp16.caffemodel";
const String config = "deploy.prototxt";

int main(void){
    VideoCapture cap(0);
    
    if(!cap.isOpened()){
        cerr << "Camera open failed!" << endl;
        return -1;
    }
    
    Net net = readNet(model, config);
    
    if(net.empty()){
        cerr << "Net open failed!" << endl;
        return -1;
    }
    
    Mat frame;
    while(true){
        cap >> frame; // 카메라 입력
        if(frame.empty())
            break;
        
        
        Mat blob = blobFromImage(frame, 1, Size(300,300), Scalar(104,177,123));
        net.setInput(blob);
        Mat res = net.forward();
        
        Mat detect(res.size[2], res.size[3], CV_32FC1, res.ptr<float>()); // Nx7 크기 2차원 행렬로 변환
        
        for(int i=0; i < detect.rows; i++){
            float confidence = detect.at<float>(i,2); // 신뢰도
            if (confidence < 0.5)
                break;
            
            
            // 얼굴 검출 사각형 영역 좌측상단 좌표와 우측하단 좌표
            int x1 = cvRound(detect.at<float>(i,3)* frame.cols);
            int y1 = cvRound(detect.at<float>(i,4)* frame.rows);
            int x2 = cvRound(detect.at<float>(i,5)* frame.cols);
            int y2 = cvRound(detect.at<float>(i,6)* frame.rows);
            
            // 영상에서 얼굴검출 영역에 녹색 사각ㄱ형을 그리고, 얼굴 신뢰도를 출력한다.
            rectangle(frame, Rect(Point(x1, y1), Point(x2,y2)), Scalar(0, 255, 0));
            
            String label = format("Face: %4.3f" , confidence);
            putText(frame, label, Point(x1,y1-1), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(0,255,0));
            
        }
        
        imshow("frame", frame);
        if(waitKey(1)==27)
            break;
    }
    return 0;
}
