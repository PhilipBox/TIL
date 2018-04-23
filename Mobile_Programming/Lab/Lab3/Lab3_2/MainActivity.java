package org.androidtown.lab3_2;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;

public class MainActivity extends AppCompatActivity {

    EditText Name;
    RadioGroup Gender;
    RadioButton Male;
    RadioButton Female;
    CheckBox SMS;
    CheckBox EmailAddrs ;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Name = findViewById(R.id.name);
        Gender = findViewById(R.id.gender);
        Male = findViewById(R.id.male);
        Female = findViewById(R.id.female);
        SMS =findViewById(R.id.sms);
        EmailAddrs = findViewById(R.id.email);
        Button BtnRegister = findViewById(R.id.btn_register);

        BtnRegister.setOnClickListener(new View.OnClickListener(){

            @Override
            public void onClick(View view) {
                Log.v("알림", "onClick method 실행.");
                String str_Name = Name.getText().toString();

                String str_Gender = "";
                if(Gender.getCheckedRadioButtonId()== R.id.male)
                    str_Gender = Male.getText().toString();

                if(Gender.getCheckedRadioButtonId()==R.id.female)
                    str_Gender = Female.getText().toString();

                String str_SMS = "";
                if(SMS.isChecked()) {
                    str_SMS = (String) SMS.getText().toString();
                }

                String str_Email = "";
                if(EmailAddrs.isChecked()) {
                    str_Email = (String) EmailAddrs.getText().toString();
                }

                Intent intent1 = new Intent(getApplicationContext(), RegisterActivity.class);
                intent1.putExtra("name", str_Name);
                intent1.putExtra("gender", str_Gender);
                intent1.putExtra("sms", str_SMS);
                intent1.putExtra("email", str_Email);

                Log.v("알림", "StartActivity 이전");
                startActivity(intent1);
                finish();

            }//end onClick method
        });//end setOnClickListener

    }
}
