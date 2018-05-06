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
            Pnt.setStrokeWidth(8);
            Pnt.setColor(Color.RED);

            Pnt.setStyle(Paint.Style.FILL);
            canvas.drawCircle(50,50,40,Pnt);
            // FILL : 채우기 O , 테두리 X
            // Style이 FILL 이므로, 테두리는 그리기 않고, 지정해 놓은 색깔(RED)로 채움.

            Pnt.setStyle(Paint.Style.STROKE);
            canvas.drawCircle(150, 50,40,Pnt);
            // STROKE : 채우기 X , 테두리 그리기
            // Style이 STROKE 이므로, 채우기 없이 테두리만 색칠하는 것이므로, 지정해 놓은 테두리 크기8 만큼 빨간색 테두리가 그려진다.

            Pnt.setStyle(Paint.Style.FILL_AND_STROKE);
            canvas.drawCircle(250, 50,40,Pnt);
            // FILL_AND_STROKE : 채우기 + 테두리 그리기
            // Style이 FILL_AND_STROKE 이므로, 채우기와 테두리를 모두 그린다.

            Pnt.setColor(Color.BLUE);           // Paint 색깔 변경
            Pnt.setStyle(Paint.Style.FILL);     // 바뀐 Paint 색깔로 Style 지정 - FILL
            canvas.drawCircle(50,150, 40, Pnt); // 지정된 좌표에 지정해 놓은 Paint로 그리기.
            Pnt.setColor(Color.RED);            // Paint 색깔 변경
            Pnt.setStyle(Paint.Style.STROKE);   // 바뀐 Paint 색깔로 Style 지정 - STROKE
            canvas.drawCircle(50,150,40,Pnt);   // 지정된 좌표에 지정해 놓은 Paint로 그리기.

            Pnt.setColor(Color.RED);            // Paint 색깔 변경
            Pnt.setStyle(Paint.Style.STROKE);   // 바뀐 Paint 색깔로 Style 지정 - STROKE
            canvas.drawCircle(150,150,40,Pnt);  // 지정된 좌표에 지정해 놓은 Paint로 그리기.
            Pnt.setColor(Color.BLUE);           // Paint 색깔 변경
            Pnt.setStyle(Paint.Style.FILL);     // 바뀐 Paint 색깔로 Style 지정 - FILL
            canvas.drawCircle(150,150,40,Pnt);  // 지정된 좌표에 지정해 놓은 Paint로 그리기.
        }
    }
}
