package com.example.philip.asynctaskdemo;

import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    TextView tvCounter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        tvCounter = (TextView) findViewById(R.id.tv_counter);

        new CountDownTask().execute(); //Starts the CountDownTask
    }

    private class CountDownTask extends AsyncTask<Void, Integer, Void>{

    @Override
        protected void onPreExecute() {
        tvCounter.setText("*START*");
    }

    @Override
        protected Void doInBackground(Void... params) {
        for (int i = 15; i >= 0; i--) {
            try {
                Thread.sleep(1000);
                publishProgress(i);
            } catch (Exception e) {
            }
        }
            return null;
    }
    @Override
        protected void onProgressUpdate(Integer... values) {
        tvCounter.setText(Integer.toString(values[0].intValue()));
    }

    @Override
        protected void onPostExecute(Void aVoid) {
        tvCounter.setText("*DONE*");
    }


    }//end CountDownTask
}
