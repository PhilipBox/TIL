package org.androidtown.lab3_2;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import org.w3c.dom.Text;

/**
 * Created by hwan on 2018-04-23.
 */

public class RegisterActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        Intent intent = getIntent();

        String str_Name = intent.getStringExtra("Name");
        String str_Gender = intent.getStringExtra("Gender");
        String str_SMS = intent.getStringExtra("SMS");
        String str_Email = intent.getStringExtra("EmailAddrs");

        TextView rgs_Name = findViewById(R.id.print_name);
        TextView rgs_Gender = findViewById(R.id.print_gender);
        TextView rgs_Receive = findViewById(R.id.print_receive);

        rgs_Name.append(": " + str_Name);
        rgs_Gender.append(": " + str_Gender);
        rgs_Receive.append(": " + str_SMS + " " + str_Email);


        Button button = findViewById(R.id.back_btn);
        button.setOnClickListener(new View.OnClickListener(){

            @Override
            public void onClick(View view) {
                Intent intent2 = new Intent(getApplicationContext(), MainActivity.class);
                startActivity(intent2);
                finish();
            }
        });
    }


}
