package com.example.philip.fbtesting;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

public class MainActivity extends AppCompatActivity {

    private Button sendbt;
    private EditText editdt;
    public String msg;

    private FirebaseDatabase firebaseDatabase = FirebaseDatabase.getInstance();
    private DatabaseReference databaseReference = firebaseDatabase.getReference();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        sendbt = (Button) findViewById(R.id.button2);
        editdt = (EditText) findViewById(R.id.editText);


        sendbt.setOnClickListener(new Button.OnClickListener() {
            public void onClick(View v) {
                msg = editdt.getText().toString();
                databaseReference.child("name").push().setValue(msg);
            }
        });
    }
}
