package org.androidtown.lab3_1;

import android.graphics.Color;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {

    Button btn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btn = findViewById(R.id.btn);
        // Register the View to which the context menu should be associated
        registerForContextMenu(btn);
    }

    // Didn't use the menu XML.
    // When the registered view receives a long-click event, the system calls this method
    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo) {
        super.onCreateContextMenu(menu, v, menuInfo);
        menu.setHeaderTitle("Button Menu");
        menu.add(0, 1, 0, "Red");
        menu.add(0, 2, 0, "Green");
        menu.add(0, 3, 0, "Blue");
    }

    // When the user selects a menu item, the system calls this method
    public boolean onContextItemSelected(MenuItem item) {

        // get ID from item
        switch (item.getItemId()) {
            case 1:
                btn.setTextColor(Color.RED);
                return true;

            case 2:
                btn.setTextColor(Color.GREEN);
                return true;

            case 3:
                btn.setTextColor(Color.BLUE);
                return true;
        }
        return true;
    }//end onContextItemSelected method
}