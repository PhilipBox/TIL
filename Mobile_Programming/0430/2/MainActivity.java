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

            // 캡모양 테스트

            Pnt.setColor(Color.BLUE);
            Pnt.setStrokeWidth(16);
            canvas.drawLine(50,30,240,30,Pnt);
            Pnt.setStrokeCap(Paint.Cap.ROUND);
            canvas.drawLine(50,60,240,60,Pnt);
            Pnt.setStrokeCap(Paint.Cap.SQUARE);
            canvas.drawLine(50,90,240,90,Pnt);

            // 조인 모양 테스트

            Pnt.setColor(Color.BLACK);
            Pnt.setStrokeWidth(20);
            Pnt.setStyle(Paint.Style.STROKE);
            Pnt.setStrokeJoin(Paint.Join.MITER);
            canvas.drawRect(50,150,90,200,Pnt);
            Pnt.setStrokeJoin(Paint.Join.BEVEL);
            canvas.drawRect(120,150,160,200,Pnt);
            Pnt.setStrokeJoin(Paint.Join.ROUND);
            canvas.drawRect(190,150,230,200,Pnt);



        }
    }

}//end Class
