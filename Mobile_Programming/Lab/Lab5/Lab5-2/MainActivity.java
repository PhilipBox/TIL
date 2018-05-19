package com.example.philip.lab5_2;

import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    TextView processTextView;
    TextView resultTextView;
    EditText edit_num;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        edit_num = findViewById(R.id.editText);
        processTextView = findViewById(R.id.process);
        resultTextView = findViewById(R.id.result);

        Button calBtn = findViewById(R.id.calBtn);
        calBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                processTextView.setText("");
                new Task(Integer.parseInt(edit_num.getText().toString())).execute();
            }//end onClick method
        });//end Listener
    }//end onCreate method


    protected class Task extends AsyncTask<Void,Integer,Void>{
        int n = 0;
        long fact = 1;

        public Task(int num){
            n = num;
        }//end Task

        @Override
        protected void onPreExecute(){
            super.onPreExecute();
        }//end onPreExecute

        @Override
        protected Void doInBackground(Void... voids) {
            for(int i=n;i>=1;i--){
                fact *= i;
                publishProgress(i);
                try {
                    Thread.sleep(500);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            return null;
        }//end doInBackGround

        @Override
        protected void onProgressUpdate(Integer... values) {
            super.onProgressUpdate(values);
            processTextView.append(""+values[0]+ " ");
        }//end ProgressUpdate

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
            resultTextView.setText("=\t"+fact+ " ");
        }//end onPostExecute
    }//end Task class
}//end MainActivity