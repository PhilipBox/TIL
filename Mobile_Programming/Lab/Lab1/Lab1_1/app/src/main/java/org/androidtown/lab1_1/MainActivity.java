package org.androidtown.lab1_1;

import android.media.Image;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ImageView;
import android.view.View;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    ImageView tot;
    ImageView tot2;
    int imageIndex = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        tot = findViewById(R.id.tot);
        tot2 = findViewById(R.id.tot2);
    }

    public void onButton1Clicked(View v){
        changeImage();
    }

    //When button is clicked, then change the image.
    private void changeImage(){
        if(imageIndex==0) {
            tot.setVisibility(View.VISIBLE);
            tot2.setVisibility(View.INVISIBLE);

            imageIndex = 1;     // variable to change next image
        }
        else if(imageIndex == 1) {
            tot.setVisibility(View.INVISIBLE);
            tot2.setVisibility(View.VISIBLE);

            imageIndex = 0;     // variable to change next image
        }
    }
}