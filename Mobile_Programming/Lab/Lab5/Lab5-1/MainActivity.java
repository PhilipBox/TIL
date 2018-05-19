package com.example.philip.lab5_1;

import android.media.Image;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    ImageView imageView1;
    ImageView imageView2;
    EditText editText;
    Button button;
    Handler handler = new Handler();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        imageView1 = (ImageView) findViewById(R.id.imageView1);
        imageView2 = (ImageView) findViewById(R.id.imageView2);
        editText = (EditText) findViewById(R.id.editText);
        button = (Button) findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {

            //When I click the button, make Threads
            @Override
            public void onClick(View v) {
                CatThread thread1 = new CatThread(0);
                thread1.start();

                CatThread thread2 = new CatThread(1);
                thread2.start();
            }
        });
    }//end onCreate method

    class CatThread extends Thread{
        int catIndex;
        int stateIndex;

        ArrayList<Integer> images = new ArrayList<Integer>();

        public CatThread(int index){
            catIndex = index;
            images.add(R.drawable.cat_1);
            images.add(R.drawable.cat_2);
            images.add(R.drawable.cat_3);
        }

        public void run(){
            stateIndex = 0;
            for (int i=0; i<9; i++){
                final String msg = "Cat #"+ catIndex + " state: "+ stateIndex;
                handler.post(new Runnable() {
                    @Override
                    public void run() {
                        editText.append(msg + "\n");
                        if(catIndex == 0)
                            imageView1.setImageResource(images.get(stateIndex));
                        else if(catIndex == 1)
                            imageView2.setImageResource(images.get(stateIndex));
                    }
                });


                try{
                    int sleepTime = getRandomTime(500,3000);
                    Thread.sleep(sleepTime);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

                stateIndex++;
                if (stateIndex >= images.size()){
                    stateIndex = 0;
                }

            }//end for loop
        }//end run method
    }//end CatThread class

    public int getRandomTime(int min, int max){
        return min+(int)(Math.random() * (max-min)) ;
    }//end getRandomTime method
}//end MainActivity class
