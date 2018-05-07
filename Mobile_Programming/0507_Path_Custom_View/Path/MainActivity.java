package org.androidtown.photo_choice;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

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
            Path path = new Path();             // Path 객체 생성
            canvas.drawColor(Color.WHITE);       // canvas 색상 지정

            Paint Pnt = new Paint();            // Paint 객체 생성
            Pnt.setStrokeWidth(5);              // 외곽선(테두리)두께 설정
            Pnt.setColor(Color.RED);            // Paint 색상 설정
            Pnt.setStyle(Paint.Style.STROKE);   // Paint style 설정 : STROKE(외곽선만 그리기)


            // 원, 사각형을 Path로 정의한 후 출력
            path.addRect(100,00, 150,90, Path.Direction.CW);    // closed shapes 을 경로에 추가할 때의 방향을 지정.
            path.addCircle( 50,50,40,Path.Direction.CW);                  // CW : ClockWise(시계방향으로)
            canvas.drawPath(path, Pnt);       // canvas에 path와 Paint 호출

            // Path로 정의한 후 출력
            path.reset();                     // path 초기화
            path.moveTo(10,100);        // 시작 좌표 지정
            path.lineTo(50,150);        // 시작좌표에서부터 (50,150)까지 line을 그림.
            path.lineTo(400,10);        // (50,150)좌표에서부터 (400,10)까지 line을 그림.
            Pnt.setStrokeWidth(3);            // Paint의 width을 3으로 지정
            Pnt.setColor(Color.BLUE);         // Paint의 Color : BLUE 지정
            canvas.drawPath(path,Pnt);        // canvas에 path와 Paint 호출

            // Path위에 Text 출력
            Pnt.setTextSize(20);              // TextSize 설정
            Pnt.setStyle(Paint.Style.FILL);   // Paint style 설정 : FILL
            canvas.drawTextOnPath("My github name is PhilipBox", path, 0,0,Pnt);
                                    // drawTextOnPath( "text내용", '어떤 path?', 시작지점x좌표, 시작지점y좌표, Paint);
                                    // 글씨를 쓰는 것은 Paint에 의해서 쓰는 것!
        }
    }
}
