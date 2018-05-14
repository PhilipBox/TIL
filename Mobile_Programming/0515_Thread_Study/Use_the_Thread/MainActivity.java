package com.example.philip.threadex;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    Button showBtn;
    TextView textView;
    Boolean running;
    int value;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        showBtn = (Button) findViewById(R.id.button);
        textView = (TextView) findViewById(R.id.textView);

        showBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                textView.setText("스레드에서 받은 값 : " + value);
                // 버튼을 누르면 텍스트뷰에 현재 value에 할당된 정수 값을 표시
            }
        });
    }//end onCreate method

    protected void onResume() {
        super.onResume();

        running = true;

        Thread thread1 = new BackgroundThread();
        thread1.start();
        // 액티비티가 화면에 보이면 새로 정의한 스레드 시작

    }//end onResume method


    protected void onPause() {
        super.onPause();

        running = false;
        value = 0;
        // 액티비티가 멈추면 스레드 중지

    }//end onPause method

    class BackgroundThread extends Thread {     // Thread class를 상속하여 새로운 스레드 정의
        public void run (){
            while(running){
                try{
                    Thread.sleep(1000);     // 스레드 안에서 1초마다 value의 값을 증가시킴
                    value++;
                }catch (InterruptedException ex){
                    Log.e("SampleJavaThread", "Exception in thread.", ex);
                }//end catch
            }//end while
        }

    }

}//end MainActivity class
