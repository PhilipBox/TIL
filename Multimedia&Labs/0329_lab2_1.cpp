#include <iostream>
#include <opencv2/opencv.hpp>
using namespace std;
using namespace cv;

int main(int argc, const char *argv[]) {
    
    string imageName("/Users/philip/tth.jpeg");
    double alpha;
    int beta;
    
    if(argc > 1)
        imageName = argv[1];
    
    Mat image;
    
    image = imread(imageName.c_str(), IMREAD_COLOR);
    
    if(image.empty()) {
        cout << "Could not open or find the image " << endl;
        return -1;
    }
    
    cout << "Hello Jihwan" << '\n';
    
    Mat new_image = Mat::zeros( image.size(), image.type() );
    
    std::cout<<" Basic Linear Transforms " <<std::endl;
    std::cout<<"-------------------------" <<std::endl;
    std::cout<<" Enter the alpha  value  [1.0~3.0]:"; std::cin>>alpha;
    std::cout<<" Enter the beta value [0-100]: "; std::cin>>beta;
    
    for(int y=0; y< image.rows; y++){
        for(int x=0; x<image.cols; x++){
            for(int c=0; c<3; c++){
                new_image.at<Vec3b>(y,x)[c] = saturate_cast<uchar>( alpha*( image.at<Vec3b>(y,x)[c])*beta);
            }
        }
    }
    
    namedWindow("Original Image", 1);
    namedWindow("New Image", 1);
    
    imshow("Original Image", image);
    imshow("New Image", new_image);

    
    waitKey(0);
    return 0;
}
