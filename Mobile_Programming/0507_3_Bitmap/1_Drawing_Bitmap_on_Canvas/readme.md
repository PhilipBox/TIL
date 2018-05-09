### Drawing_Bitmap_on_Canvas
�̹����� Bitmap ���·� ��ȯ�ؼ�, Canvas�� ǥ���ϴ� ���� �ǹ�.<br>
Canvas�� Bitmap �� �׸��� ���� ������ �ִ�!<br>
`drawBitmap()` method : Bitmap�� ������ Canvas�� �׸� �� ���� method.<br>
***
### Bitmap�� �������� 2���� ���
## ù ��° ���
1. Resources r = getResources();<br>
2. BitmapDrawable bd=(BitmapDrawable) r.getDrawable(ID);<br>
3. Bitmap pic = bd.getBitmap();<br><br>
1 : ���ҽ��� �غ�Ǿ� �־�� �Ѵ�. Bitmap�� ���� ���ҽ� ��ü�� �����ϴ� �ܰ�.<br>
2 : Drawable ��ο� �ִ� `�̹���`�� ��.<br>
3 : 3�� ������ �����ߴٸ�, drawable ��ü�� �ִ� Bitmap������ ������ ���̸�, �̰��� ������ Canvas�� �׸��� �۾��� ������ �� �ִ�!<br>

## �� ��° ���
Bitmap pic = BitmapFactory.decodeResource(getResource(), ID);<br><br>

ù ��° ����� �� �ٷ� �����ϰ� �� �� ����!<br>
���� ������ drawable�� ID�� getResource�� ���ؼ� ���� resource�� �Ű��� �Ѱ��ָ� �ȴ�!<br><br>
## `drawBitmap(Bitmap bitmap, float left, float top, Paint paint)`
e.g.) canvas.drawBitmap(pic, 0,0, null);<br>
1. pic : ù ��° ����, Bitmap ��ü!<br>
2,3. 0 : ��,����° ����, Bitmap�� ǥ���� ��ġ!<br>
4. null : �� ��° ����, ����Ʈ ����!<br>
***
***
## `createScaledBitmap()` method 
e.g.) Bitmap sm = Bitmap.createScaledBitmap(pic, 50, 75, false);<br>
�� method�� ���ؼ� Bitmap�� scale�� ������ �� ����!<br><br>
4��° �Ķ���� : <br>
`false` �� ���� pixel �� �����ϸ�, ũ�⸦ ����/<br>
`true` �� ���� �� ũ�⿡ �°� pixel ���� �����Ͽ�, ����� �°� ������ �̹��� ����(�޸� ��� ����)<br> 