# Android Interview Question

## 안드로이드의 컴포넌트에 대해서 설명하세요.
A) 안드로이드의 컴포넌트는 4가지로, Activity, Service, Broadcast Receiver, Content Provider가 있습니다.

그 중 Activity는 안드로이드에서 화면을 관리하고, 다양한 이벤트를 처리하는데 사용됩니다.

Service는 화면에서는 보이지 않지만, 특정 기능을 백그라운드에서 처리하는데 사용됩니다.

Broadcast Receiver는 안드로이드에서 발생하는 브로드캐스트 메시지를 처리하기 위한 컴포넌트입니다.

Content Provider는 앱 사이의 데이터 공유를 위한 인터페이스를 제공하는 컴포넌트입니다.

  ## 안드로이드의 수명주기(Life Cycle)에 대해서 설명하세요.



## 안드로이드의 Manifest에 대해서 설명하세요.

Manifest 파일은 앱의 이름, 버전, 구성 요소, 권한 등 앱의 실행에서 꼭 필요한 정보가 저장되어 있는 파일입니다.

application 태그에는 앱 아이콘, 앱 이름을 정의하고,
activity 태그에는activity 클래스명과 activity이름을 정의하며,
service, receiver, provider 태그에는 각각 서비스,  리시버, 프로바이더에 대한 내용을 정의합니다.
permission 태그에는 인터넷처럼 앱에 필요한 권한 내용을 정의합니다.

  