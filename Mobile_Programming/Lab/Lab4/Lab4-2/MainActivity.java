package com.example.philip.lab4_2;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.LinearLayout;

public class MainActivity extends AppCompatActivity {

    Button OPEN_PAGE_BUTTON;
    Button CLOSE_PAGE_BUTTON;

    LinearLayout BASE_LAYOUT;
    LinearLayout SLIDE_LAYOUT;

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        OPEN_PAGE_BUTTON=findViewById(R.id.base_btn);
        CLOSE_PAGE_BUTTON=findViewById(R.id.sliding_btn);

        BASE_LAYOUT=findViewById(R.id.base_area);
        SLIDE_LAYOUT=findViewById(R.id.slide_area);

        // When OPEN PAGE button is clicked,
        OPEN_PAGE_BUTTON.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Animation anim = AnimationUtils.loadAnimation(
                        getApplicationContext(), R.anim.left);
                SLIDE_LAYOUT.startAnimation(anim);
                SLIDE_LAYOUT.setVisibility(View.VISIBLE);
            }
        });

        // When CLOSE PAGE button is clicked,
        CLOSE_PAGE_BUTTON.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Animation anim = AnimationUtils.loadAnimation(
                        getApplicationContext(), R.anim.right);
                SLIDE_LAYOUT.startAnimation(anim);
                SLIDE_LAYOUT.setVisibility(View.GONE);
            }
        });
    }//end onCreate method
}//end MainActivity class