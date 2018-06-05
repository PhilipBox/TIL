package com.example.philip.location;

import android.content.Context;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    TextView textView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        textView = (TextView) findViewById(R.id.textView);

        Button button = (Button) findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                startLocationService();

            }//end onClick method
        });//end button Listener

    }//end onCreate method


    private void startLocationService(){
        LocationManager manager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);

        GPSListener gpsListener = new GPSListener();
        long minTime = 10000;
        float minDistance = 0;

        try{
            manager.requestLocationUpdates(LocationManager.GPS_PROVIDER,
                    minTime,
                    minDistance,
                    gpsListener);

            Location lastLocation = manager.getLastKnownLocation(LocationManager.GPS_PROVIDER);
            if(lastLocation != null){
                Double latitude = lastLocation.getLatitude();
                Double longtitude = lastLocation.getLongitude();

                textView.setText("내 위치 : "+ latitude + ", " + longtitude);
                Toast.makeText(getApplicationContext(), "Last Known Location : " + "Latitude : "+ latitude + "\nLongitude:"+ longtitude, Toast.LENGTH_LONG).show();

            }

        }catch (SecurityException ex){
            ex.printStackTrace();
        }

        Toast.makeText(getApplicationContext(), "위치확인이 시작되었습니다. 로그를 확인하세요.",
                Toast.LENGTH_LONG).show();
    }

    public class GPSListener implements LocationListener {

        @Override
        public void onLocationChanged(Location location) {
            Double latitude = location.getLatitude();
            Double longitude = location.getLongitude();

            String msg = "Latitude : " + latitude + "\nLongitude : " + longitude;
            Log.i("GPSListener", msg);

            textView.setText("내 위치 : "+latitude + ", " + longitude);
            Toast.makeText(getApplicationContext(),msg,Toast.LENGTH_LONG).show();


        }
        @Override
        public void onProviderDisabled(String provider) {

        }
        @Override
        public void onProviderEnabled(String provider) {

        }
        @Override
        public void onStatusChanged(String provider, int status, Bundle extras) {

        }
    }


}//end MainActivity class
