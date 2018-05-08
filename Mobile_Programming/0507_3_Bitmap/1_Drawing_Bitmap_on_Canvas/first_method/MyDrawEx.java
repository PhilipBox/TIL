package org.androidtown.custom_second;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
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

        Paint Pnt = new Paint();
        canvas.drawColor(Color.WHITE);

        // Bitmap을 자르는 부분
        Bitmap bitm2 =Bitmap.createBitmap(sm, 100,100,sm.getWidth()-1000, sm.getHeight()-200);
        // createBitmap( 오리지날 Bitmap, x,y, 가로에서 1000만큼 뺀 크기, 세로에서 200 만큼 뺀 크기);
        // x,y는 각각의 수치만큼 떨어진 곳에서.

        canvas.drawBitmap(bitm2,0,0,Pnt);

    }
}
