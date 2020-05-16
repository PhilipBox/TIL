1. ## 안드로이드 앱 개발 요소 
   1. 카메라 촬영 가이드 기능.
   OpenCV 라이브러리에 Sobel Edge Detection이라는 방법
   먼저 Edge Detection이란, 테두리(즉, 경계면)을 검출하는 방법을 말함.

   다시 말해서, 이미지의 픽셀 값이 급격하게 변하는 지점

   ![](https://lh3.googleusercontent.com/fSffjf1OjspB34J4M-wNuQen6IbNedD03TgbCGKZawdAfD8nb_j41SxdRWJ-SZvFpyTer5gBx3Mwe3l7TN5R1lQB4P1sLtVezsLWxrzXqZeCVxecn6sr-AX7zZiU8-XYQaqTNwP8)

   Sobel Edge Detection은 1차 미분을 기준으로 한 유명한 Edge Detection 방법.

   이 방법은, 일반적으로 3x3의 행렬을 사용하여 연산을 하였을때 중심을 기준으로 각방향의 앞뒤의 값을 비교하여서 변화량을 검출하는 알고리즘. 이 기준이 되는 행렬을 필터 또는 마스크라고 함.

   x,y축 방향으로 진행하는 2개의 필터가 있고, 각 필터 연산결과의 절대값의 합을 구하면 최종적으로 가장자리를 인식하게 됨.
   어떤 이미지가 흰색과 검정색으로만 이루어져있고, 물체 또는 사물의 테두리는 흰색으로 표현되어있는 경우가 이러한 엣지 디텍션을 통해 생성된 이미지임.

   이전에 촬영해두었던 사진을 이 필터를 거쳐서 테두리만 현재 촬영하고있는 카메라에 띄워줌.
   그러면 이전에 촬영해둔 사진을 그대로 따라서 기억에 의존하지 않고 흐트러지지 않게 촬영할 수 있다는 장점을 가진 기능을 구현.


   2. GIF 변환기능
   먼저, GIF란 Graphic Interchange Format으로 이미지 비손실 압축 방식을 말함.
   여러 장의 사진을 이어붙여 영상처럼 표현되는 파일 형태로, 인터넷에서 많이 쓰이고 있음.

   사용자가 찍은 수 많은 사진들을 하나의 GIF파일로 이어붙일 수 있는 기능도 함께 제공.
   그래서, 집 앞의 벚꽃이 피고 지는 과정, 내 방 안의 화분이 성장하는 과정, 임산부의 배가 불러오는 10개월의 과정을 하나의 GIF파일로 저장할 수 있음.

   이 기능을 위해서 구글이 개발한 Glide라는 오픈소스 라이브러리를 사용하였음.
   간단하게 gradle에 의존성 영역에 추가하여 사용할 수 있었음.

   여러 사진들을 하나의 GIF사진으로 변환시켜주는 기능은 gifEncoder opensource를 활용하였고, GIF 파일을 핸들링하는 영역은 glide를 활용.
   Android에서는 기본적으로는 GIF파일을 불러올 수 없었지만, glide를 활용하여 기능을 구현해낼 수 있었음.

   3. Notification 푸시 알람 기능
   Notification을 활용한 기본적인 푸시 알람 기능은 많은 예제를 통해 학습했었음. 하지만 기능을 구현하고 난 뒤에, 테스트를 진행하다가 예상하지 못한 어려움을 겪었음.

   디바이스를 재부팅하면, 예정되어 있던 알람들이 울리지 않는다는 이슈.

   실제로 Notification 기능을 학습할 때는 ‘재부팅이 되어도 기록이 존재할까?’라는 의심을 해본 적도 없었고, 문제에 직면했을 때도 당연히 저장되어 있을 것이라고 생각했었음.

   하지만, 개발자 커뮤니티와 외국 유튜브 채널 찾아보며, 디바이스를 재부팅할때, PendingIntent가 사라지면서 알람 요청 기록이 남아있지 않아 발생하는 문제점이라는 것을 알아내었음.

   이 문제점을 해결하기 위해서, BOOT_COMPLETED 브로드캐스트를 통해서 디바이스가 부팅이 되었을 때 신호를 받아 BootReceiver에서 알람을 재등록하는 Service를 구현함으로써 문제점을 해결할 수 있었음.