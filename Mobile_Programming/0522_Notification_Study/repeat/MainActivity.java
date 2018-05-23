package com.example.philip.testalarm;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import java.util.Calendar;

public class MainActivity extends AppCompatActivity {

    private static final long A_WEEK = 1000 * 60 * 60 * 24 * 7;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Intent intent = new Intent(MainActivity.this, BroadcastD.class);

        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(System.currentTimeMillis());
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.WEDNESDAY);
        calendar.set(Calendar.HOUR_OF_DAY, 18);
        calendar.set(Calendar.MINUTE, 00);

        PendingIntent pi = PendingIntent.getBroadcast(MainActivity.this, 0, intent, 0);

        AlarmManager alarmMgr = (AlarmManager)getSystemService(Context.ALARM_SERVICE);
        alarmMgr.setRepeating(AlarmManager.RTC, calendar.getTimeInMillis(), A_WEEK, pi);
    }
}
