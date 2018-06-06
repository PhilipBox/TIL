package com.example.philip.myaudioexample;

import android.media.MediaPlayer;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    static final String AUDIO_URL = "https://sites.google.com/site/ubiaccessmobile/sample_audio.amr";
    private MediaPlayer mediaPlayer;
    private int playbackPosition = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button startBtn = (Button) findViewById(R.id.playBtn);
        Button pauseBtn = (Button) findViewById(R.id.pauseBtn);
        Button restartBtn = (Button) findViewById(R.id.restartBtn);

        startBtn.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v) {
                try {
                    playAudio(AUDIO_URL);
                    Toast.makeText(getApplicationContext(), "음악 파일 재생", Toast.LENGTH_LONG).show();
                } catch (Exception e) {e.printStackTrace();}
            }//end onClick method
        });//end startBtn Listener

        pauseBtn.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v) {
                // 만약, mediaPlayer가 실행중이라면!
                if(mediaPlayer != null){
                    playbackPosition = mediaPlayer.getCurrentPosition();
                    mediaPlayer.pause();
                    Toast.makeText(getApplicationContext(), "음악 파일 재생 중지됨.", Toast.LENGTH_LONG).show();
                }
            }//end onClick method
        });// pauseBtn listener

        restartBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(mediaPlayer!=null && !mediaPlayer.isPlaying()){
                    mediaPlayer.start();
                    mediaPlayer.seekTo(playbackPosition);
                    Toast.makeText(getApplicationContext(), "음악 파일 재생 재시작됨", Toast.LENGTH_LONG).show();
                }

            }//end onClick method
        });//end restartBtn listener
    }//end onCreate method

    private void playAudio(String url) throws Exception{
        killMediaPlayer();

            mediaPlayer = new MediaPlayer();
            mediaPlayer.setDataSource(url);
            mediaPlayer.prepare();
            mediaPlayer.start();

    }//end playAudio method

    protected void onDestroy(){
        super.onDestroy();
        killMediaPlayer();
    }//end onDestroy method

    private void killMediaPlayer(){
        if(mediaPlayer != null){
            try {
                mediaPlayer.release();
            }catch (Exception e) {e.printStackTrace();}
        }
    }//end killMediaPlayer method
}//end MainActivity class
