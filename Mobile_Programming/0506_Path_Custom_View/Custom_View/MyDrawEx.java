package org.androidtown.photo_choice;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.View;

/**
 * Created by hwan on 2018-05-07.
 */

public class MyDrawEx extends View {

    // XML에서 layout으로 사용하기 위해서는 생성자 2개 필요
    public MyDrawEx(Context c) {
        super(c);
    }
    public MyDrawEx(Context c, AttributeSet a){
        super(c,a);
    }

    @Override
    protected void onDraw(Canvas canvas){
        super.onDraw(canvas);
        Paint paint = new Paint();
        paint.setColor(Color.RED);

        canvas.drawColor(Color.WHITE);
        for(int x = 0; x<200; x+=5){
            canvas.drawLine(x,0,200-x,100, paint);  // (x,0)부터 (200-x,100)까지 paint로 선 긋기.
        }
    }


}//end MyDrawEx class
