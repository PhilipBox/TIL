package com.example.philip.lab6_1;

import android.os.Environment;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class MainActivity extends AppCompatActivity {

    private Button btnWriteSDFile;
    private Button btnClearScreen;
    private Button btnReadSDFile;
    private Button btnFinishApp;
    private EditText EditData;

    private String SDPath;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        SDPath = Environment.getExternalStorageDirectory().getAbsolutePath();
        final File directory = new File (SDPath+"/");
        directory.mkdir();

        EditData = (EditText) findViewById(R.id.editData);

        btnWriteSDFile = (Button) findViewById(R.id.btnFirst);
        btnClearScreen = (Button) findViewById(R.id.btnSecond);
        btnReadSDFile = (Button) findViewById(R.id.btnThird);
        btnFinishApp  = (Button) findViewById(R.id.btnFourth);

        btnWriteSDFile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try{
                    File myFile = new File(directory, "mysdfile.txt");
                    OutputStreamWriter myOutWriter = new OutputStreamWriter(
                            new FileOutputStream(myFile));
                    myOutWriter.append(EditData.getText());
                    myOutWriter.close();
                    Toast.makeText(getApplicationContext(), "Done Writing SD 'mysdfile.txt'", Toast.LENGTH_LONG).show();
                }catch (Exception e){
                    Toast.makeText(getApplicationContext(), e.getMessage(), Toast.LENGTH_LONG).show();
                }
            }//end onClick
        });//end Listener


        btnClearScreen.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v) {
                EditData.setText("");
            }//end onClick method
        });//end Listener


        btnReadSDFile.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v) {
                try {
                    BufferedReader myReader = new BufferedReader(new InputStreamReader(new FileInputStream(new File(directory, "mysdfile.txt"))));
                    String aDataRow = "";
                    String aBuffer = "";
                    while((aDataRow = myReader.readLine()) != null){
                        aBuffer += aDataRow + "\n";
                    }
                    EditData.setText(aBuffer);
                    myReader.close();
                    Toast.makeText(getApplicationContext(), "Done reading SD 'mysdfile.txt'", Toast.LENGTH_LONG).show();

                }catch (Exception e){
                    Toast.makeText(getApplicationContext(), e.getMessage(), Toast.LENGTH_LONG).show();
                }

            }//end onClick method
        });//end Listener


        btnFinishApp.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v) {
                finish();
            }//end onClick method
        });//end Listener


    }//end onCreate method
}//end MainActivity class
