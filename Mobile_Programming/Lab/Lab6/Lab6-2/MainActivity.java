package com.example.philip.lab6_2;

import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    EditText student_id_edit,name_edit;
    Button call_btn,save_btn,clear_btn;

    SharedPreferences share;
    SharedPreferences.Editor edit;

    String name,id;

    protected void onCreate(final Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        student_id_edit=findViewById(R.id.first_edit);
        name_edit=findViewById(R.id.second_edit);

        call_btn=findViewById(R.id.first_btn);
        call_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                applySharedPreference();
            }//end onClick method
        });//end listener

        save_btn=findViewById(R.id.second_btn);
        save_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                id=student_id_edit.getText().toString();
                name=name_edit.getText().toString();
                sharedPreference();
            }//end onClick method
        });//end listener

        clear_btn=findViewById(R.id.third_btn);
        clear_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                student_id_edit.setText("");
                name_edit.setText("");
                id="";
                name="";
            }//end onClick method
        });//end listener
    }//end onCreate method

    public void sharedPreference(){
        share=getSharedPreferences("Login Credentials",MODE_PRIVATE);
        edit=share.edit();

        edit.putString("Id",id);
        edit.putString("Name",name);
        edit.commit();
    }//end sharedPreference method


    public void applySharedPreference(){
        share=getSharedPreferences("Login Credentials",MODE_PRIVATE);
        if(share!=null&&share.contains("Name")){
            name=share.getString("Name","fail");
            name_edit.setText(name);
        }
        if(share!=null&&share.contains("Id")) {
            id=share.getString("Id","fail");
            student_id_edit.setText(id);
        }
    }//end applySharedPreference method
}//end MainActivity class