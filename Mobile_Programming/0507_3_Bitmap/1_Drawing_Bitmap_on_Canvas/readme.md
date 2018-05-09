### Drawing_Bitmap_on_Canvas
이미지를 Bitmap 형태로 변환해서, Canvas에 표현하는 것을 의미.<br>
Canvas에 Bitmap 을 그리기 위한 절차가 있다!<br>
`drawBitmap()` method : Bitmap을 가지고 Canvas에 그릴 때 쓰는 method.<br>
***
### Bitmap을 가져오는 2가지 방법
## 첫 번째 방법
1. Resources r = getResources();<br>
2. BitmapDrawable bd=(BitmapDrawable) r.getDrawable(ID);<br>
3. Bitmap pic = bd.getBitmap();<br><br>
1 : 리소스가 준비되어 있어야 한다. Bitmap을 담을 리소스 객체를 생성하는 단계.<br>
2 : Drawable 경로에 있는 `이미지`를 얻어냄.<br>
3 : 3번 과정을 진행했다면, drawable 객체에 있는 Bitmap정보를 생성한 것이며, 이것을 가지고 Canvas에 그리는 작업을 수행할 수 있다!<br>

## 두 번째 방법
Bitmap pic = BitmapFactory.decodeResource(getResource(), ID);<br><br>

첫 번째 방법을 한 줄로 간단하게 할 수 있음!<br>
내가 참조할 drawable의 ID와 getResource를 통해서 얻어온 resource를 매개로 넘겨주면 된다!<br><br>
## `drawBitmap(Bitmap bitmap, float left, float top, Paint paint)`
e.g.) canvas.drawBitmap(pic, 0,0, null);<br>
1. pic : 첫 번째 인자, Bitmap 객체!<br>
2,3. 0 : 두,세번째 인자, Bitmap을 표현할 위치!<br>
4. null : 네 번째 인자, 페인트 설정!<br>
***
***
## `createScaledBitmap()` method 
e.g.) Bitmap sm = Bitmap.createScaledBitmap(pic, 50, 75, false);<br>
이 method를 통해서 Bitmap의 scale을 조정할 수 있음!<br><br>
4번째 파라미터 : <br>
`false` 는 현재 pixel 수 유지하며, 크기를 조정/<br>
`true` 는 조정 된 크기에 맞게 pixel 수를 조정하여, 사이즈에 맞게 선명한 이미지 제공(메모리 사용 증가)<br> 