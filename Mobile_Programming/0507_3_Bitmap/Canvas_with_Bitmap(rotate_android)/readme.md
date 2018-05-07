### Key Point
회전하는 효과를 적용시킬 때! 중요한 메소드는 invalidate();야 !

## invalidate();
`invalidate();` 이 메소드는 기존에 그렸던 것을 무효화하고 onDraw를 호출해서 다시 그려라 라는 명령어야.<br>
처음에 onCreate할때 호출됐던 onDraw이것을 무효화 시키고 다시 그리는 작업을 수행한다는 것이야.<br>
다시 그릴 때는 invalidate();위에 코드를 보면, 각도가 업데이트 되었기 때문에!!!

***
## drawBitmap( 비트맵 객체, 비트맵을 표현할 X좌표, 비트맵을 표현할 Y좌표, 페인트);
e.g.) canvas.drawBitmap(pic, 0,0,null);<br>
캔버스에 그리는 과정!

## canvas.save();
`save();`는 그린 것을 holding 한다는 것!