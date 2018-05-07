package org.androidtown.drawable;

import android.graphics.drawable.TransitionDrawable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ImageButton;

public class MainActivity extends AppCompatActivity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ImageButton button = (ImageButton) findViewById(R.id.button);
        TransitionDrawable drawable = (TransitionDrawable) button.getDrawable();
        drawable.startTransition(5000); // 5초 후에 Transition을 실시하라.
                                // 실행되는 것을 보니까, 5초에 걸쳐서 실행이 되더라.
                                // 투명도가 변하는 방식으로, 5초 뒤에는 투명하지 않은 원본 이미지가 됨!
                                // 새롭게 나타나는 이미지가 기존 이미지 위에 덮어짐, 기존 이미지도 존재
    }
}
