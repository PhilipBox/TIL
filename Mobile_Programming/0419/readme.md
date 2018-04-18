## ScrollView

ScrollView일 경우 LinearLayout의 orientation을 vertical로 설정해줘야 함.


HorizontalScrollView일 경우, LinearLayout의 orientation default value는 horizontal이지만, 써주지 않으면 error가 발생한다.<br>
반드시 android.orientation="horizontal"을 써주도록 한다.