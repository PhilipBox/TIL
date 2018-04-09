package org.androidtown.lab2_2;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    EditText URL;
    Button nextBtn;

    Intent data;
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Get URL EditText and NEXT button by ID.
        URL=findViewById(R.id.edit_URL);
        nextBtn=findViewById(R.id.btn_next);

        data=new Intent(this,NewActivity.class);

        // When NEXT button clicked
        nextBtn.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                String url=URL.getText().toString();
                data.putExtra("url",url);
                startActivity(data);
            }
        });
    }
}