OpenGL

`glutInit()` 윈도우 운영체제와 세션 연결<br>
`glFlush()` 드라이버에 더 이상 명령어를 쌓지 말고 현재까지 쌓인 명령어 모두를 무조건 프로세서에 전달하도록 강제하는 명령.

`glutCreateWindow()` 타이틀 바 파라미터를 넘기면서 GLUT에게 새 윈도우를 생성하라는 것.
`glutDisplayFunc()` 화면 디스플레이 이벤트가 발생하면 ( ) 내부의 콜백 함수를 실행하라는 것. 다시 말해, 어떤 명령을 실행하라는 것이 아니라, 화면 디스플레이 이벤트가 발생할 때 실제로 어떤 함수를 호출해야 하는지를 등록하는 함수.

`glutMainLoop()` 이벤트별로 콜백 함수를 등ㄴ록했으므로 이벤트 루프(Event Loop)로 진입하라는 함수. 따라서 모든 GL program은 항상 `glutMainLoop()` 함수로 끝난다.


`glutInit(&argc,argv)` GLUT 윈도우 함수, GLUT 라이브러리를 초기화하고 윈도우 운영체제와 연결하여 하나의 세션을 형성

`glClear(GL_COLOR_BUFFER_BIT)` 컬러 버퍼(GL_COLOR_BUFFER_BIT), 즉 프레임 버퍼를 초기화(Clear)하라는 의미. 초기화에 사용될 색은 이전의 glClearColor()에서 설정한 색.

`glClearColor()` 초기화 색(Clearing Color)이라는 상태 변수의 값을 설정하는 함수. 여기서 파라미터의 값은 최소 0.0에서 최대 1.0을 기준으로 명시한 것으로, R,G,B 빛의 세기가 각각 0.0으로 모두 최소이므로 이를 합하면 흑색이 됨. 네 번째 파라미터는 알파(Alpha)라고 불리는 것으로, 불투명도(Opacity)를 나타낸다. 이 값이 1.0이면, 100% 불투명하고 뒷 배경색이 보이지 않는다.

