package org.androidtown.lab3_3;

import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;


public class MainActivity extends AppCompatActivity {

    public Button btn_frag1;
    public Button btn_frag2;

    FirstFragment firstFragment;
    SecondFragment secondFragment;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        init();

        setListener();
    }//end onCreate

    public void init() {
        btn_frag1 = findViewById(R.id.btn1);
        btn_frag2 = findViewById(R.id.btn2);

        firstFragment = new FirstFragment();
        secondFragment = new SecondFragment();
        getSupportFragmentManager().beginTransaction().replace(R.id.framelayout_for_fragment, firstFragment).commit();

        Log.d("Init", firstFragment.toString());
    }//end init method

    private void setListener(){

        btn_frag1.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                android.support.v4.app.FragmentManager m = getSupportFragmentManager();
                android.support.v4.app.FragmentTransaction ft = m.beginTransaction();
                ft.replace(R.id.framelayout_for_fragment, firstFragment);
                ft.commit();
            }
        }); //end onClick - btn_frag1

        btn_frag2.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                getSupportFragmentManager().beginTransaction().replace(R.id.framelayout_for_fragment, secondFragment).commit();
            }
        }); //end onClick - btn_frag2

    }//end setListener method
}
