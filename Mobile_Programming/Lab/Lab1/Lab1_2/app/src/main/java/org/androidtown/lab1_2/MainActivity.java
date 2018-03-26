package org.androidtown.lab1_2;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    public Button clearBtn = null;
    public Button printBtn = null;
    public EditText editText = null;
    public TextView textView = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        clearBtn = findViewById(R.id.clear_btn);
        printBtn = findViewById(R.id.print_btn);

        editText = findViewById(R.id.name_edit);
        textView = findViewById(R.id.name_text_view);

        //If you clicked the CLEAR button,then the field of 'text view area' and 'edit text' are cleared by using "" empty string.
        clearBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                textView.setText("");
                editText.setText("");
            }
        });
        //If you clicked the PRINT button,then all of string  from edit_text is printed in 'text_view area'
        printBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                textView.setText(editText.getText().toString());
            }
        });
    }
}