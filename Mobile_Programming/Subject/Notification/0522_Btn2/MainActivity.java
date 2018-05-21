package com.example.philip.buttonnoti;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button  NotiBtn = (Button) findViewById(R.id.btn);
        NotiBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showNotification("CHALNA", "오늘의 '찰나'를 기록하시겠어요?");
            }//end onClick method
        });//end OnClickListener
    }//end onCreate method

    public void showNotification(String title, String msg){
        Intent notifyIntent = new Intent(this, MainActivity.class);
        notifyIntent.setFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
        PendingIntent pendingIntent = PendingIntent.getActivities(this, 0, new Intent[] {notifyIntent}, PendingIntent.FLAG_UPDATE_CURRENT);

        Notification notification = new Notification.Builder(this)
                .setSmallIcon(R.drawable.camera)
                .setContentTitle(title)
                .setContentText(msg)
                .setAutoCancel(true)
                .setContentIntent(pendingIntent)
                .build();

        notification.defaults |= Notification.DEFAULT_SOUND;    // 소리
        notification.defaults |= Notification.DEFAULT_VIBRATE;  // 진동
        NotificationManager notificationManager =
                (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
        notificationManager.notify(2,notification);

    }//end showNotification method

}//end MainActivity class
