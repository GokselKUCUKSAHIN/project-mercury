package com.example.projectmercury;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.Bundle;
import android.widget.TextView;

public class ShowResults extends AppCompatActivity
{

    TextView tx;
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_show_results);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT); //only portait
        tx = (TextView)findViewById(R.id.textResult);
        //

        if(getIntent().hasExtra("data"))
        {
            tx.setText(getIntent().getExtras().getString("data").toString());
        }
    }
}
