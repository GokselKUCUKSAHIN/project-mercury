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

public class MainActivity extends AppCompatActivity
{

    private TextView infoLabel;
    private EditText userField;
    private EditText passFiled;
    private Button login;
    private Button signUp;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT); //only portait

        // Defines
        infoLabel = (TextView) findViewById(R.id.infoLabel);
        userField = (EditText) findViewById(R.id.userNameField);
        passFiled = (EditText) findViewById(R.id.passwordField);
        login = (Button) findViewById(R.id.buttonLogin);
        signUp = (Button) findViewById(R.id.buttonSignUp);

        // Events
        signUp.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                Intent startSignUpPage = new Intent(getApplicationContext(), SignUp.class);
                startActivity(startSignUpPage);
                clearTexts();
                //finish();
            }
        });

        login.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                UserLogin retriveData = new UserLogin();
                retriveData.execute("");
            }
        });
    }

    private String getUserName()
    {
        String getString = userField.getText().toString();
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

    private String getPassword()
    {
        String getString = passFiled.getText().toString();
        if (getString.trim().length() == 0)
        {
            //null
            //printLabel("You must enter a password");
            return "-1";
        } else
        {
            return getString;
        }
    }

    private void printLabel(final String msg)
    {
        runOnUiThread(new Runnable()
        {
            @Override
            public void run()
            {
                if (msg != null)
                    infoLabel.setText(msg);
            }
        });
    }

    private void goToSearchProduct(final int id)
    {
        runOnUiThread(new Runnable()
        {
            @Override
            public void run()
            {
                Intent searchProduct = new Intent(getApplicationContext(), SearchProduct.class);
                searchProduct.putExtra("id", id);
                startActivity(searchProduct);
                finish();
            }
        });
    }

    public void clearTexts()
    {
        runOnUiThread(new Runnable()
        {
            @Override
            public void run()
            {
                userField.setText("");
                passFiled.setText("");
            }
        });
    }

    private class UserLogin extends AsyncTask<String, String, String>
    {

        @Override
        protected void onPreExecute()
        {
            printLabel("Connecting to database...");
        }

        @Override
        protected String doInBackground(String... strings)
        {
            Connection connection = null;
            Statement statement = null;
            int id = -1;
            try
            {
                Class.forName(DBObject.JDBC_DRIVER);
                connection = DriverManager.getConnection(DBObject.DATABASE_URL, DBObject.connProps);
                statement = connection.createStatement();
                id = DBObject.logInUser(statement, getUserName(), getPassword());
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

            if (id != -1)
            {
                printLabel(id + "");
                // we are in
                goToSearchProduct(id);
            } else
            {
                printLabel("Check Username and Password!");
            }
            return null;
        }

    }
}