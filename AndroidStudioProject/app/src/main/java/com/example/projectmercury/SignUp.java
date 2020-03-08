package com.example.projectmercury;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class SignUp extends AppCompatActivity
{

    Button gotoLoginButton;
    Button signUpButton;
    EditText userName;
    EditText pass1;
    EditText pass2;
    TextView label;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_up);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT); //only portait
        //
        gotoLoginButton = (Button) findViewById(R.id.btnGoToLogin);
        signUpButton = (Button) findViewById(R.id.signBtn);
        userName = (EditText) findViewById(R.id.userName);
        pass1 = (EditText) findViewById(R.id.pass1field);
        pass2 = (EditText) findViewById(R.id.pass2field);
        label = (TextView) findViewById(R.id.infoLabelSign);

        //Events
        gotoLoginButton.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                //Intent goToLogin = new Intent(getApplicationContext(), MainActivity.class);
                //startActivity(goToLogin);
                finish();
            }
        });

        signUpButton.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                UserSignUp usu = new UserSignUp();
                usu.execute("");
            }
        });
    }

    private void printLabel(final String msg)
    {
        runOnUiThread(new Runnable()
        {
            @Override
            public void run()
            {
                if (msg != null)
                    label.setText(msg);
            }
        });
    }

    private String getUserName()
    {
        String getString = userName.getText().toString();
        if (getString.trim().length() == 0)
        {
            //null
            //printLabel("User name can't be Empty");
            return "-1";
        } else
        {
            return getString;
        }
    }

    private String getPass1()
    {
        String getString = pass1.getText().toString();
        if (getString.trim().length() == 0)
        {
            //null
            //printLabel("User name can't be Empty");
            return "";
        } else
        {
            return getString;
        }
    }

    private String getPass2()
    {
        String getString = pass2.getText().toString();
        if (getString.trim().length() == 0)
        {
            //null
            //printLabel("User name can't be Empty");
            return "";
        } else
        {
            return getString;
        }
    }

    private class UserSignUp extends AsyncTask<String, String, String>
    {

        @Override
        protected void onPreExecute()
        {
            printLabel("Connecting to database...");
        }

        @Override
        protected String doInBackground(String... strings)
        {
            String msg = "";
            Connection connection = null;
            Statement statement = null;
            try
            {
                Class.forName(DBObject.JDBC_DRIVER);
                connection = DriverManager.getConnection(DBObject.DATABASE_URL, DBObject.connProps);
                statement = connection.createStatement();
                msg = DBObject.signUpUser(statement, getUserName(), getPass1(), getPass2());
            }
            catch (ClassNotFoundException e)
            {
                printLabel("No Class");
                e.printStackTrace();
            }
            catch (SQLException e)
            {
                printLabel("SQL Database error");
                e.printStackTrace();
            }
            finally
            {
                DBObject.closeConnections(statement, connection);
            }
            printLabel(msg);
            return null;
        }
    }
}