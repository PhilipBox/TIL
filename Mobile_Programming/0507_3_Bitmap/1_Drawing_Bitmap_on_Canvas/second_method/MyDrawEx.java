package org.androidtown.custom_second;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;

/**
 * Created by hwan on 2018-05-07.
 */

public class MyDrawEx extends View {
    public MyDrawEx(Context c) {
        super(c);
    }
    public MyDrawEx(Context c, AttributeSet a) {
        super(c, a);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        Bitmap sm = BitmapFactory.decodeResource(getResources(), R.drawable.image);

        // first method를 아래와 같이 간단하게 할 수 있는 방법도 있음.
        // 내가 참조할 Drawable의 ID와 getResource를 통해서, 얻어온 Resource를 매개로 넘겨주면 가능하다.
        // 추출해서 그리는 것 까지 '한단계'로!
        Paint Pnt = new Paint();
        canvas.drawColor(Color.WHITE);
        canvas.drawBitmap(sm, new Rect(100, 0, 500, 500), new Rect(0, 0,400,500), Pnt);
        // 1. sm : Bitmap을 넘겨줌.
        // 2. 첫 번째 사각형 : 추출해낼 사각형의 영역
        // 3. 두 번째 사각형 : 캔버스 어디에 그릴지의 영역
        // 4. Paint
    }
}
