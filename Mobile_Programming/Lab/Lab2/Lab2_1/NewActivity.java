package org.androidtown.lab2_1;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class NewActivity extends AppCompatActivity{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_new);

        // Get Close button by ID.
        Button btn=findViewById(R.id.btn2);

        Intent data=getIntent();

        String name = null;
        String age= null;
        if(data!=null){
            name=data.getStringExtra("name");
            age=data.getStringExtra("age");
        }
        String Toast_info="Received Info : "+name+","+age ;
        // Float closing Toast msg.
        Toast.makeText(getApplication(),Toast_info,Toast.LENGTH_LONG).show();

        // When Close button clicked
        btn.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }

}