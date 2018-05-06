### Path
Path�� ����, �, �ٰ��� ���� ���� ���� ������ ������ �׷��� ��ü.<br>
Path�� ���Ǹ����δ� ȭ�鿡 ǥ�õ��� ������  drawPath() �� ȣ���� �־��<br>
path ���Ǹ� ���� Canvas �� �׸���.

##How to use
`reset()` : path �ʱ�ȭ.<br>
`moveTo(float x, float y)` : (x, y)�� �������� �ű�.<br>
`lineTo(float x, float y)` : ���������� (x, y)���� line �׸���<br><br>
 
`addCircle(float x, float y, float radius, Path.Direction dir)`<br>
`addRect(RectF rect, Path.Direction dir)`
-> Path.Direction : closed shapes �� ��ο� �߰��� ���� ������ ����.<br>
-> CW : ClockWise(�ð����)<br>
-> CCW : Counter-ClockWise(�ݽð����)<br><br>

`quadTo(float x1, float y1, float x2, float y2)`<br>
 : ���������� (x1, y1)����, �׸��� (x2, y2)���� ����¸� �׸���. (����Ű ��� ����)<br><br>
 
`cubicTo(float x1, float y1, float x2, float y2, float x3, float y3)`<br>
 : quad�� ���� ���������� (x1, y1) -> (x2, y2) -> (x3, y3) ���� ��� �׸�<br><br>
 
`rLineTo(float x, float y)`<br>
`rCubicTo(float x1, float y1, float x2, float y2, float x3, float y3)`<br>
 : r�� ���� �༮���� �������� (0,0) ó�� �����.<br>
   �׷��� ���� ��ǥ�� �ƴ�, �������� �������� �� �����ǥ�� ������� �Ѵ�.<br><br>
 
`drawPath (Path path, Paint paint)` : ������ path�� ȭ�鿡 print<br>
