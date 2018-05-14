package com.example.philip.newthread;

import android.os.Handler;
import android.os.Message;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.ProgressBar;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    TextView textView0;
    ProgressBar bar;
    Handler handler;
    ProgressRunnable runnable;
    boolean isRunning = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        textView0 = (TextView) findViewById(R.id.TextView01);
        bar = (ProgressBar) findViewById(R.id.progress);

        handler = new Handler();
        runnable = new ProgressRunnable();
    }//end onCreate method

    @Override
    protected void onStart() {
        super.onStart();
        bar.setProgress(0);
        Thread thread1 = new Thread(new Runnable() {
            @Override
            public void run() {
                try{for(int i=0; i<20 && isRunning; i++){
                    Thread.sleep(1000);
                    handler.post(runnable);
                }
            }catch (Exception ex) {
                    Log.e("MainActivity", "Exception in processing message.", ex);
                }}
        });
        isRunning = true;
        thread1.start();
    }

    @Override
    protected void onStop() {
        super.onStop();
        isRunning = false;
    }
    public class ProgressRunnable implements Runnable {
        public void run() {
            bar.incrementProgressBy(5);
            if(bar.getProgress()==bar.getMax()){
                textView0.setText("Done");
            }else {
                textView0.setText("Working..."+bar.getProgress());
            }
        }
    }
}//end class

