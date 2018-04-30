package org.androidtown.myapplication;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
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
            Paint Pnt = new Paint(Paint.ANTI_ALIAS_FLAG);

            Pnt.setStrokeWidth(8);
            Pnt.setColor(RED);

            // 채우기

            Pnt.setStyle(Paint.Style.FILL);
            canvas.drawCircle(50,50,40,Pnt);

            // 외곽선 그리기

            Pnt.setStyle(Paint.Style.STROKE);
            canvas.drawCircle(150,50,40,Pnt);

            // 외곽선 및 채우기

            Pnt.setStyle(Paint.Style.FILL_AND_STROKE);
            canvas.drawCircle(250,50,40,Pnt);

            // 파란색으로 채우고 빨간색으로 외곽선 그리기

            Pnt.setColor(Color.BLUE);
                Pnt.setStyle(Paint.Style.FILL);
                canvas.drawCircle(50,150,40,Pnt);
                Pnt.setColor(Color.RED);
                Pnt.setStyle(Paint.Style.STROKE);
                canvas.drawCircle(50,150,40,Pnt);

            // 빨간색으로 외곽선 그리고 파란색으로 채우기

            Pnt.setColor(Color.RED);
            Pnt.setStyle(Paint.Style.STROKE);
            canvas.drawCircle(150,150,40,Pnt);
            Pnt.setColor(Color.BLUE);
            Pnt.setStyle(Paint.Style.FILL);
            canvas.drawCircle(150,150,40,Pnt);

        }
    }

}//end Class
