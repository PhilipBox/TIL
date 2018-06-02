package com.example.philip.lab6_3;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    SQLiteDatabase db;
    MySQLiteOpenHelper helper;

    EditText nameEdit, IdEdit;
    Button add, del;

    ListView listView;
    String[] list;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        helper = new MySQLiteOpenHelper(getApplicationContext(), "stuInfo.db", null, 1);

        nameEdit = findViewById(R.id.name_edit);
        IdEdit = findViewById(R.id.student_id_edit);

        listView = findViewById(R.id.listView);

        add = findViewById(R.id.addBtn);
        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String name = nameEdit.getText().toString();
                String id = IdEdit.getText().toString();
                if (name.isEmpty() || id.isEmpty()) {
                    Toast.makeText(getApplicationContext(), "모든 항목을 입력해주세요.", Toast.LENGTH_LONG).show();
                } else {
                    insert(name, id);
                    invalidate();
                }
            }//end onClick method
        });//end listener


        del = findViewById(R.id.deleteBtn);
        del.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String name = nameEdit.getText().toString();
                if (name.isEmpty())
                    Toast.makeText(getApplicationContext(), "이름을 입력해주세요.", Toast.LENGTH_LONG).show();
                else {
                    delete(name);
                    invalidate();
                }
            }//end onClick method
        });//end listener
    }//end onCreate method


    public void insert(String name, String id) {
        db = helper.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put("number", id);
        values.put("name", name);
        db.insert("stuInfo", null, values);
    }//end insert method


    public void delete(String name) {
        db = helper.getWritableDatabase(); //get db object
        db.delete("stuInfo", "name=?", new String[]{name});
    }//end delete method


    public void select() {
        db = helper.getReadableDatabase();
        Cursor c = db.query("stuInfo", null, null, null, null, null, null);
        list = new String[c.getCount()];
        int count = 0;

        while (c.moveToNext()) {
            list[count] = c.getString(c.getColumnIndex("name"))
                    + " " + c.getString(c.getColumnIndex("number"));
            count++;
        }
        c.close();
    }//end select method


    private void invalidate() {
        select(); //select from the table by cursor
        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, list);
        listView.setAdapter(adapter); //adapt to listView
    }//end invalidate method
}//end MainActivity class


class MySQLiteOpenHelper extends SQLiteOpenHelper {
    public MySQLiteOpenHelper(Context context, String name, SQLiteDatabase.CursorFactory factory, int version) {
        super(context, name, factory, version);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        String sql = "create table stuInfo (" + //table creation
                "name text, " +
                "number text);";
        db.execSQL(sql);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        String sql = "drop table if exists stuInfo"; //on upgrade: if exists the table, drop and make the table with sql
        db.execSQL(sql);
        onCreate(db);
    }
}//end MySQLiteOpenHelper class