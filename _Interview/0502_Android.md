## 안드로이드의 Activity 수명주기(Life Cycle)에 대해서 설명하세요.
onCreate() 메소드가 실행이 되는데, 이 부분에서는 일반적으로 초기화 작업을 많이 합니다.<br>
이어서 onStart() 메소드가 실행이 되는데, 이 부분부터 사용자가 Activity를 볼 수 있습니다.  그리고 실제로 사용자와 상호작용이 가능한 포그라운드에 위치하면 onResume() 메소드가 실행이 됩니다.
이 상태가 Activity가 실행중인 것으로 봅니다.

Activity 실행중인 상태에서 상태가 변하게 되어, 사용자와 상호작용이 불가능한 상태 즉, 포커스를 잃게 되면 onPause() 메소드가 호출됩니다. 

그런데, 상태가 변했을 때, 기존의 Activity가 완전히 가려진 상태라면 onStop() 메소드가 실행이 됩니다.
onStop()메소드의 실행 이후에, 다시 기존의 Activity로 돌아가게 되면 onRestart()메소드가 실행되고 기존 Activity의 onStart()메소드부터 차례로 다시 실행이 됩니다.

Activity의 전환이 아니라 아예 Activity가 종료된 것이라면 onDestroy() 메소드가 실행되고 종료합니다.

## 안드로이드 4대 컴포넌트란에 대하여 설명하세요.
안드로이드의 컴포넌트는 4가지로, Activity, Service, Broadcast Receiver, Content Provider가 있습니다.

그 중 Activity는 안드로이드에서 화면을 관리하고, 다양한 이벤트를 처리하는데 사용됩니다.
Service는 화면에서는 보이지 않지만, 특정 기능을 백그라운드에서 처리하는데 사용됩니다.
Broadcast Receiver는 안드로이드에서 발생하는 브로드캐스트 메시지를 처리하기 위한 컴포넌트입니다.
Content Provider는 앱 사이의 데이터 공유를 위한 인터페이스를 제공하는 컴포넌트입니다.

Activity : UI 화면을 담당하고, Activity class를 꼭 상속 받아야합니다.  Activity가 기본적으로 가지고 있는 Life-Cycle method를 재정의해서 원하는 방식으로 앱을 제작하고 구현해야 합니다.
- 특징.
		1. 안드로이드는 하나 이상의 Activity를 가지고 있어야한다.
		2. 두 개의 Activity동시에 display할수없다.
		3. 다른 앱의 Activity도 불러낼 수 있다.
		4. Activity내에서 fragment를 추가해서 분할시킬 수 있다.

Service : 백그라운드에서 실행되는 서비스로,  manifest에 등록되어야 합니다. Activity내에서 startService를 통해서 실제 서비스를 실행해서 동작시킬 수 있습니다.
- 특징
	1. 화면이 없다
	2. 한번 시작된 Service는 애플리케이션이 종료되어도 계속 백그라운드에서 돌아간다. (화면에 보이지 않더라도)
	3. 모든 Service는 Service class를 상속받아서 사용한다.
	4. Service는 네트워크를 통해 데이터를 가져올 수 있다.

Broadcast Receiver 
	1. 디바이스에서 발생하는 어떠한 일 중에 애플리케이션이 알아야하는 상황이 발생하면 알려준다.
	2. Receiver를 통해서 디바이스의 상황을 감지하여 적절한 작업 수행이 가능하다.

Content Provider : 데이터를 관리하고, 데이터를 제공하는 컴포넌트입니다. 주로, db에 데이터를 전달하고 받을때 많이 사용합니다.
- 특징 
	1. 파일입출력, SQLite db, 웹 등을 통해 데이터를 관리하는 데이터 관리측면의 컴포넌트이다.
	2. Content Provide를 통해서 다른 애플리케이션의 데이터도 변경할 수 있다.

4대 컴포넌트들이 소통하기 위해서는 Intent를 이용해서 호출하거나 동작을 합니다. Intent라는것은 메시지를 담은 객체이다.
이 Intent를 통해서 Activity를 호출한다던지, Service를 호출하는 것과 같은 작업을 할 수 있습니다. 
즉, Intent는 4대 컴포넌트를 제어할 수 있는 메시지다.