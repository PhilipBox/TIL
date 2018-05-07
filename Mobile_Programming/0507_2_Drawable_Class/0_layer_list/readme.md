### Layer list
## `layers.xml` in drawable directory
`layers.xml` file은, res/drawable/layers.xml 이렇게 drawable폴더 내에서 생성해줘야 한다!<br>
drawableb resource file로 만들면 된다!<br><br>
android_red와, android_green, android_blue 역시 drawable directory내에 복사해주면 됨.<br><br>
`layers.xml` 내의 코드를 보면 <item> 내부에 <bitmap>이 nested 되어있음을 꼭! 확인하기!<br>
이 xml에서는, drwable안의 image들을 불러온다!<br>
## `activity_main.xml`
`activity_main.xml` 에서는 앞서 drwable을 불러주는 xml을 부르는 ImageView를 만들어 준다.




