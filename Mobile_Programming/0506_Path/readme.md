### Path
Path는 직선, 곡선, 다각형 등의 도형 궤적 정보를 가지는 그래픽 객체.<br>
Path의 정의만으로는 화면에 표시되지 않으며  drawPath() 를 호출해 주어야<br>
path 정의를 따라 Canvas 에 그린다.

##How to use
`reset()` : path 초기화.<br>
`moveTo(float x, float y)` : (x, y)로 기준점을 옮김.<br>
`lineTo(float x, float y)` : 기준점에서 (x, y)까지 line 그리기<br><br>
 
`addCircle(float x, float y, float radius, Path.Direction dir)`<br>
`addRect(RectF rect, Path.Direction dir)`
-> Path.Direction : closed shapes 을 경로에 추가할 때의 방향을 지정.<br>
-> CW : ClockWise(시계방향)<br>
-> CCW : Counter-ClockWise(반시계방향)<br><br>

`quadTo(float x1, float y1, float x2, float y2)`<br>
 : 기준점에서 (x1, y1)까지, 그리고 (x2, y2)까지 곡선형태를 그린다. (나이키 모양 생각)<br><br>
 
`cubicTo(float x1, float y1, float x2, float y2, float x3, float y3)`<br>
 : quad와 같이 기준점에서 (x1, y1) -> (x2, y2) -> (x3, y3) 로의 곡선을 그림<br><br>
 
`rLineTo(float x, float y)`<br>
`rCubicTo(float x1, float y1, float x2, float y2, float x3, float y3)`<br>
 : r이 붙은 녀석들은 기준점을 (0,0) 처럼 여긴다.<br>
   그래서 절대 좌표가 아닌, 기준점을 기준으로 한 상대좌표를 적어줘야 한다.<br><br>
 
`drawPath (Path path, Paint paint)` : 설정한 path를 화면에 print<br>
