package org.androidtown.myapplication;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.support.v4.app.Fragment;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Toast;

import static android.graphics.Color.RED;

public class MainActivity extends AppCompatActivity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        MyView vm = new MyView(this);
        setContentView(vm);

    }//end onCreate

    protected class MyView extends View {
        public MyView(Context context) {
            super(context);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            Path path = new Path();
            canvas.drawColor(Color.WHITE);

            Paint Pnt = new Paint();
            Pnt.setStrokeWidth(5);
            Pnt.setColor(Color.RED);
            Pnt.setStyle(Paint.Style.STROKE);

            // 원, 사각형을 패스로 정의한 후 출력
            path.addRect(100,00,150,90, Path.Direction.CW);
            path.addCircle(50,50,40,Path.Direction.CW);
            canvas.drawPath(path,Pnt);

            // 패스로 정의한 후 출력
            path.reset();
            path.moveTo(10,110);
            path.lineTo(50,150);
            path.lineTo(400,10);
            Pnt.setStrokeWidth(3);
            Pnt.setColor(Color.BLUE);
            canvas.drawPath(path, Pnt);

            // 패스 위에 텍스트 출력
            Pnt.setTextSize(20);
            Pnt.setStyle(Paint.Style.FILL);
            canvas.drawTextOnPath("Text on Path.", path, 0, 0, Pnt);


        }
    }

}//end Class
