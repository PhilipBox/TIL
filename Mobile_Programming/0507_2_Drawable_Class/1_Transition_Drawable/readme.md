### Transition Drawable
## Transition 에서 `지정해 놓은 시간에 걸쳐서`  다른 이미지가 덮어 씌워진다.
my_transition.xml file은, res/drawable/my_transition.xml이렇게 drawable폴더 내에서 생성해줘야 한다!<br>
drawableb resource file로 만들면 된다!<br><br>
android_red와, android_green 역시 drawable directory내에 복사해주면 됨.
***
## my_transition.xml
이 xml file에서는, 변환 될 image item을 2개 준비한다.

***
## startTransition( int time);
MainActivity.java 내에서 쓰는 코드! <br>
e.g.) drawable.startTransition(5000); // 5초 후에 Transition을 실시하라.<br>
                                // 실행되는 것을 보니까, 5초에 걸쳐서 실행이 되더라.<br>
                                // 투명도가 변하는 방식으로, 5초 뒤에는 투명하지 않은 원본 이미지가 됨!<br>
                                // 새롭게 나타나는 이미지가 기존 이미지 위에 덮어짐, 기존 이미지도 존재<br>




