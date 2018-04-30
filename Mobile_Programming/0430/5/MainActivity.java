package org.androidtown.canvas;

import android.graphics.drawable.Drawable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.Gallery;
import android.widget.ImageView;
import android.widget.LinearLayout;

public class MainActivity extends AppCompatActivity {

    LinearLayout mLinearLayout;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mLinearLayout = new LinearLayout(this);

        // Instantiate an ImageView and define its properties
        ImageView img = new ImageView(this);
        Drawable myImage = getResources().getDrawable(R.drawable.ic_launcher);
        img.setImageDrawable(myImage);
        // to match the Drawable's dimensions
        img.setLayoutParams(new Gallery.LayoutParams(Gallery.LayoutParams.WRAP_CONTENT, Gallery.LayoutParams.WRAP_CONTENT));

        // Add the ImageView to the layout and set the layout as the content view
        mLinearLayout.addView(img);

        setContentView(mLinearLayout);

    }
}
