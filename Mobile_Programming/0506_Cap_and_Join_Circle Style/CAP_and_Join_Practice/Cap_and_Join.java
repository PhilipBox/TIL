package org.androidtown.photo_choice;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        MyView vw = new MyView(this);

        setContentView(vw);
    }

    protected class MyView extends View {
        public MyView(Context context) {
            super(context);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            Paint Pnt = new Paint(Paint.ANTI_ALIAS_FLAG);

            // 캡(CAP)모양 테스트

            Pnt.setColor(Color.BLUE);   // Paint 색 지정
            Pnt.setStrokeWidth(16);     // STROKE - 외곽선(테두리) 두께 설정
            canvas.drawLine(50,30,240,30,Pnt);  // startX,Y 좌표부터 stopX,Y 좌표까지 그리기.

            Pnt.setStrokeCap(Paint.Cap.ROUND);                            // CAP style을 ROUND로 설정.
            canvas.drawLine(50,60,240,60,Pnt);  // startX,Y 좌표부터 stopX,Y 좌표까지 그리기.

            Pnt.setStrokeCap(Paint.Cap.SQUARE);                           // CAP style을 SQUARE로 설정.
            canvas.drawLine(50,90,240,90,Pnt);  // startX,Y 좌표부터 stopX,Y 좌표까지 그리기.

            Pnt.setStrokeCap(Paint.Cap.BUTT);                             // CAP style을 BUTT로 설정.(default값 같음!)
            canvas.drawLine(50,120,240,120,Pnt);// startX,Y 좌표부터 stopX,Y 좌표까지 그리기.


            // Join 모양 테스트

            Pnt.setColor(Color.BLACK);  // Paint 색 지정
            Pnt.setStrokeWidth(20);     // STROKE - 외곽선(테두리) 두께 설정
            Pnt.setStyle(Paint.Style.STROKE);       // Paint style을 STROKE로 지정
            Pnt.setStrokeJoin(Paint.Join.MITER);    // Join - MITER : 모서리를 각진 모양으로 만듦.
            canvas.drawRect(50,150,90,200,Pnt); // (50,150)부터 (90,200)까지 사각형으로 채우기. Pnt Paint를 사용하여.

            Pnt.setStrokeJoin(Paint.Join.BEVEL);    // Join - BEVEL : 모서리가 둥글게 살짝 깍인 모양으로 만듦.
            canvas.drawRect(120, 150, 160,200, Pnt); // (120,150)부터 (160,200)까지 사각형으로 채우기. Pnt Paint를 사용하여.

            Pnt.setStrokeJoin(Paint.Join.ROUND);    // Join - ROUND : 모서리를 둥근 모양으로 만듦.
            canvas.drawRect(190, 150, 230,200, Pnt); // (190,150)부터 (230,200)까지 사각형으로 채우기. Pnt Paint를 사용하여.

        }
    }
}
