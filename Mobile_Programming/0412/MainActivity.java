package org.androidtown.study;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Date;

public class MainActivity extends AppCompatActivity {

    CheckBox chkCream;
    CheckBox chkSugar;
    Button btnPay;

    RadioGroup radioCoffeeType;
    RadioButton radDecaf;
    RadioButton radEspresso;
    RadioButton radColombian;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        chkCream = (CheckBox) findViewById(R.id.chkCream);
        chkSugar = (CheckBox) findViewById(R.id.chkSugar);
        btnPay = (Button) findViewById(R.id.btnPay);

        radioCoffeeType = (RadioGroup) findViewById(R.id.radGroupCoffeeType);
        radDecaf = (RadioButton) findViewById(R.id.radDecaf);
        radEspresso = (RadioButton) findViewById(R.id.radExpresso);
        radColombian = (RadioButton) findViewById(R.id.radColombian);


        btnPay.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v) {
                String msg = "Coffee ";
                if(chkCream.isChecked()){
                    msg += " & cream ";
                }
                if( chkSugar.isChecked()) {
                    msg += " & Sugar";
                }

                int radioID = radioCoffeeType.getCheckedRadioButtonId();

                if(radDecaf.getId()==radioID)
                    msg = "Decaf " + msg;

                if(radColombian.getId()==radioID)
                    msg = "Colombian " + msg;

                if(radEspresso.getId()==radioID)
                    msg = "Espresso " + msg;

                Toast.makeText(getApplicationContext(), msg, Toast.LENGTH_SHORT).show();
            }


        });



    }//end onCreate
}//end Class