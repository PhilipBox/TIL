package org.androidtown.study;

import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    } // End onCreate method

    public void onButton1Clicked(View v) {
        Toast.makeText(getApplicationContext(), "Pushed button", Toast.LENGTH_LONG).show();
        Intent myIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://github.com/PhilipBox"));
        startActivity(myIntent);
    }//end onButton1Clicked

    public void onButton2Clicked(View v) {
        Log.d("jjj","jhhhhh");
        Toast.makeText(getApplicationContext(), "Call Button Clicked !", Toast.LENGTH_SHORT).show();
        Intent myIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("tel:010-9211-1220"));
        //"tel:010-9211-1220"에서, tel하고 공백 추가하면 error발생. 반드시 붙여서 작성할 것.
        startActivity(myIntent);
    }

    public void onButton3Clicked(View v)
    {
        Intent myintent = new Intent(getApplicationContext(), MenuActivity.class);
        startActivity(myintent);
    }

}
