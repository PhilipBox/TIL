### Built-in tween Animation 
`tween aniamtion` : 안드로이드에서 기본적으로 제공되는 `built-in animation`이다.<br>
이 `tween aniamtion`을 지원하는 방법에는 4가지가 있다!<br>
1. Transition Animation
- Position Change : 이미지의 위치를 변경시켜 주는 것.<br>
2. Rotation Animation
- Rotation : 이미지를 회전시키는 애니메이션 기법.<br>
3. Scale Animation
- Scaling : 이미지의 크기를 늘렸다 줄였다 하는 것.<br>
4. Alpha Animation
- Transparency : 이미지의 투명도에 변화를 주는 애니메이션 기법.<br>
<br>
각각의 방법을 쓰기 위해서는, `이전 값`에서 `변화되는 값`을 지정해준다.<br>
e.g.) 투명도 A에서 B로 변환시켜라.<br>
즉, `초기값`과 `이후값`을 지정해주면서 애니메이션 효과를 구현할 수 있다!<br><br>


## Step of Tween Animation
1. Create XML animation resource file in /res/anim/directory<br>
 /res/에 anim이라는 directory를 만든다!<br><br>
2. Load the XML animation resourece file into Animation object.<br>
XML 애니메이션 리소스 파일을 애니메이션 Object로 로드한다.<br>
XML file을 만들 때, `Animation resource file`로 생성해야한다!<br><br>
3. Start Animation 