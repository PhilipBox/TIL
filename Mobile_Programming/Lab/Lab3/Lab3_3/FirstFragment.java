package org.androidtown.lab3_3;

import android.app.Activity;
import android.support.v4.app.Fragment;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

/**
 * Created by hwan on 2018-04-25.
 */

public class FirstFragment extends Fragment{

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState){
        ViewGroup rootView = (ViewGroup) inflater.inflate(R.layout.fragment_first, container, false);

        return rootView;
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();

    }
}
