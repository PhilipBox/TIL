package org.androidtown.exercise;

import android.support.v4.app.Fragment;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    Fragment mainFragment;
    MenuFragment menuFragment;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mainFragment = getSupportFragmentManager().findFragmentById(R.id.mainFragment);
        menuFragment = new MenuFragment();

    }//end onCreate

    public void onFragmentChanged(int index) {
        if(index == 0)
            getSupportFragmentManager().beginTransaction().replace(R.id.container, menuFragment).commit();
        else if (index == 1){
            getSupportFragmentManager().beginTransaction().replace(R.id.container, mainFragment).commit();
        }
    }


    // Menu code
    @Override
    public boolean onCreateOptionsMenu(Menu menu){
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int curId = item.getItemId();
        switch(curId){
            case R.id.menu_refresh:
                Toast.makeText(this, "새로고침 메뉴가 선택 됨", Toast.LENGTH_SHORT).show();
                break;
            case R.id.menu_search:
                Toast.makeText(this, "검색 메뉴가 선택 됨", Toast.LENGTH_SHORT).show();
                break;
            case R.id.menu_settings:
                Toast.makeText(this, "설정 메뉴가 선택 됨", Toast.LENGTH_SHORT).show();
                break;
            default:break;
        }
        return super.onOptionsItemSelected(item);
    }


}//end Class
