package org.androidtown.lab2_1;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    EditText Name;
    EditText Age;
    Button btn;

    Intent data;
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Get Name, Age EditText and Add button by ID.
        Name=findViewById(R.id.edit_Text1);
        Age=findViewById(R.id.edit_Text2);
        btn=findViewById(R.id.btn1);


        data=new Intent(this,NewActivity.class);

        // When Add button clicked
        btn.setOnClickListener(new View.OnClickListener() {

            public void onClick(View v) {
                //Name and Age are converted as String.
                String name=Name.getText().toString();
                String age=Age.getText().toString();
                data.putExtra("name",name);
                data.putExtra("age",age);
                startActivity(data);
            }
        });
    }
}