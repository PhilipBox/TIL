package com.example.philip.lab4_1;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;


public class MyDrawEx extends View{

    private Paint Pnt;
    private Path path;

    public void init(){
        // Create Object of Paint and Path
        Pnt = new Paint();
        path = new Path();
        Pnt.setColor(Color.RED);
        Pnt.setStrokeWidth(20);
        Pnt.setStyle(Paint.Style.STROKE);
    }
    public MyDrawEx(Context c){
        super(c);
        init();
    }
    public MyDrawEx(Context c, AttributeSet a){
        super(c,a);
        init();
    }

    // Touch Event handling
    public boolean onTouchEvent(MotionEvent event){

        if(event.getAction()==MotionEvent.ACTION_DOWN){
            path.moveTo(event.getX(),event.getY());
            invalidate();
        }

        if(event.getAction()==MotionEvent.ACTION_MOVE){
            path.lineTo(event.getX(),event.getY());
            invalidate();
        }
        return true;
    }

    // Draw process
    protected void onDraw(Canvas canvas){
        canvas.drawPath(path,Pnt);
    }
}