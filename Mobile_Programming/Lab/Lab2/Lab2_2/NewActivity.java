package org.androidtown.lab2_2;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class NewActivity extends AppCompatActivity{

    TextView textView;
    Button goBtn;
    Button backBtn;

    String url;
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_new);


        // Get text_url TextView, BACK button and GO button by ID.
        textView=findViewById(R.id.text_url);
        backBtn=findViewById(R.id.back);
        goBtn=findViewById(R.id.go);

        Intent data=getIntent();

        if(data!=null)
            url=data.getStringExtra("url");
        textView.setText(url);

        // When 'GO' button clicked
        goBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // nothing typed
                if(url.equals("")) {
                    Toast.makeText(getApplication(),"Please re-enter URL address.",Toast.LENGTH_LONG).show();
                }else{
                    Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://" + url));
                    startActivity(intent);
                }
            }
        });

        // When 'BACK' button clicked
        backBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
                Toast.makeText(getApplication(),"You pressed the BACK button.",Toast.LENGTH_LONG).show();
            }
        });
    }

}