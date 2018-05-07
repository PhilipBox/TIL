package org.androidtown.canvas1;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;

/**
 * Created by hwan on 2018-05-07.
 */

public class MyDrawEx extends View{

    private Paint mPaint;

    private Bitmap mAndroidGreen;
    private Bitmap mAndroidRed;
    private int nAngle = 0;

    public void init()
    {
        mPaint = new Paint();           // Paint 객체 초기화!

        Resources res = getResources(); // Bitmap을 담을 Resources 객체 생성!
        mAndroidGreen = BitmapFactory.decodeResource(res, R.drawable.android_green);
        mAndroidRed = BitmapFactory.decodeResource(res, R.drawable.android_red);
                                            //res에, 참조할 drawable의 ID의 리소스를 매개로 넘겨준다.
    }

    public MyDrawEx(Context c) {
        super(c);
        init();
    }

    public MyDrawEx(Context c, AttributeSet a){
        super(c,a);
        init();
    }

    public boolean onTouchEvent (MotionEvent event) {

        if(event.getAction() == MotionEvent.ACTION_UP) {
            nAngle = nAngle+10;
            invalidate();
            /*
            invalidate();
            이거는 기존에 그렸던 것을 무효화하고 onDraw를 호출해서 다시 그려라 라는 명령어야.
            처음에 onCreate할때 호출됐던 onDraw 이걸 무효화 시키고 다시 그리는 작업을 수행한다는 것이야.
            다시 그릴 때는 각도가 업데이트 되었기 때문에!!!
             */
        }
        return true;

    }//end oonTouchEvent method

    protected void onDraw (Canvas canvas) {
        canvas.drawBitmap(mAndroidGreen, 0,0, mPaint);  // 그리는 작업!
        canvas.save();              // save한다는 것은, 그린 것을 Holding 한다는 것

        canvas.rotate(nAngle);      // rotate ! 회전시킨 다음에!
        canvas.drawBitmap(mAndroidRed, 0,0, mPaint);    // 빨간색 안드로이드를 그려라.
    }

}//end class
