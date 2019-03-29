#include <iostream>
#include <opencv2/opencv.hpp>
#include <opencv2/imgproc/imgproc.hpp>

using namespace std;
using namespace cv;

int main(int argc, const char *argv[]) {
    
    string imageName("/Users/philip/tthh.png");
    string imageName2("/Users/philip/rvp.png");

    
    double alpha;
    double beta;
    
    if(argc > 1)
        imageName = argv[1];

    
    Mat image = imread(imageName.c_str(), IMREAD_COLOR);
    Mat image2 = imread(imageName2.c_str(), IMREAD_COLOR);
    
    Mat dst = Mat::zeros( image.size(), image.type() );
    
    resize(image2, image2, image.size(),0 , 0, INTER_LINEAR);

    
    if(image.empty()) {
        cout << "Could not open or find the image " << endl;
        return -1;
    }
    
    alpha = 0.7;
    beta = 1-alpha;
    
    for(int y=0; y< dst.rows; y++){
        for(int x=0; x<dst.cols; x++){
            for(int c=0; c<3; c++){
                dst.at<Vec3b>(y,x)[c] = alpha * image.at<Vec3b>(y,x)[c] + beta* image2.at<Vec3b>(y,x)[c];
            }
        }
    }
    
    namedWindow("Blended Image", 1);
    imshow("Blended Image", dst);
    

    
    waitKey(0);
    return 0;
}
