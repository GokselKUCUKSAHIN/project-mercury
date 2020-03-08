package com.example.projectmercury;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
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
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class SearchProduct extends AppCompatActivity
{

    EditText jcodeField;
    Button goButton;
    int currentID = -1;
    String selectedQuery = "";

    ArrayList<Button> buttons = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_search_product);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT); //only portait

        jcodeField = (EditText) findViewById(R.id.jcodeText);
        goButton = (Button) findViewById(R.id.btnGo);
        //
        buttons.add((Button) findViewById(R.id.btnCutFabric));
        buttons.add((Button) findViewById(R.id.btnSewFabric));
        buttons.add((Button) findViewById(R.id.btnQuiltFabric));
        buttons.add((Button) findViewById(R.id.btnCutHB));
        buttons.add((Button) findViewById(R.id.btnStrip));
        buttons.add((Button) findViewById(R.id.btnLCut));
        buttons.add((Button) findViewById(R.id.btnDrill));
        buttons.add((Button) findViewById(R.id.btnCase));
        buttons.add((Button) findViewById(R.id.btnFrame));
        buttons.add((Button) findViewById(R.id.btnRubber));
        buttons.add((Button) findViewById(R.id.btnSponge));
        buttons.add((Button) findViewById(R.id.btnWrapping));
        buttons.add((Button) findViewById(R.id.btnDress));
        buttons.add((Button) findViewById(R.id.btnFurnish));
        buttons.add((Button) findViewById(R.id.btnPackage));
        //

        buttons.get(0).setOnClickListener(new View.OnClickListener()
        {
            //CUT FABRIC
            @Override
            public void onClick(View v)
            {
                selectedQuery = String.format("CALL mercury.PrintCutFabric(%d);", currentID);
                FillData fd = new FillData();
                fd.execute();
            }
        });
        buttons.get(1).setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                selectedQuery = String.format("CALL mercury.PrintSewFabric(%d);", currentID);
                FillData fd = new FillData();
                fd.execute();
            }
        });
        buttons.get(2).setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                selectedQuery = String.format("CALL mercury.PrintQuiltFabric(%d);", currentID);
                FillData fd = new FillData();
                fd.execute();
            }
        });
        buttons.get(3).setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                selectedQuery = String.format("CALL mercury.PrintCutHB(%d);", currentID);
                FillData fd = new FillData();
                fd.execute();
            }
        });
        buttons.get(4).setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                selectedQuery = String.format("CALL mercury.PrintStripCutHB(%d);", currentID);
                FillData fd = new FillData();
                fd.execute();
            }
        });
        buttons.get(5).setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                selectedQuery = String.format("CALL mercury.PrintLCutHB(%d);", currentID);
                FillData fd = new FillData();
                fd.execute();
            }
        });
        buttons.get(6).setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                selectedQuery = String.format("CALL mercury.PrintDrillHB(%d);", currentID);
                FillData fd = new FillData();
                fd.execute();
            }
        });
        buttons.get(7).setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                selectedQuery = String.format("CALL mercury.PrintCasing(%d);", currentID);
                FillData fd = new FillData();
                fd.execute();
            }
        });
        buttons.get(8).setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                selectedQuery = String.format("CALL mercury.PrintFrameCut(%d);", currentID);
                FillData fd = new FillData();
                fd.execute();
            }
        });
        buttons.get(9).setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                selectedQuery = String.format("CALL mercury.PrintRubberPile(%d);", currentID);
                FillData fd = new FillData();
                fd.execute();
            }
        });
        buttons.get(10).setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                selectedQuery = String.format("CALL mercury.PrintSponge(%d);", currentID);
                FillData fd = new FillData();
                fd.execute();
            }
        });
        buttons.get(11).setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                selectedQuery = String.format("CALL mercury.PrintWrappingCB(%d);", currentID);
                FillData fd = new FillData();
                fd.execute();
            }
        });
        buttons.get(12).setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                selectedQuery = String.format("CALL mercury.PrintDressingFabric(%d);", currentID);
                FillData fd = new FillData();
                fd.execute();
            }
        });
        buttons.get(13).setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                selectedQuery = String.format("CALL mercury.PrintFurnishFabric(%d);", currentID);
                FillData fd = new FillData();
                fd.execute();
            }
        });
        buttons.get(14).setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                selectedQuery = String.format("CALL mercury.PrintPackage(%d);", currentID);
                FillData fd = new FillData();
                fd.execute();
            }
        });
        //
        for (Button button : buttons)
        {
            //button.setEnabled(false);
            button.setVisibility(View.GONE);
        }
        goButton.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                //xblockButtons(10);
                CheckJCode checkJCode = new CheckJCode();
                checkJCode.execute();
                GetId getId = new GetId();
                getId.execute();
            }
        });
    }


    private void goToResultActivity(final String text)
    {
        runOnUiThread(new Runnable()
        {
            @Override
            public void run()
            {
                Intent resultActivity = new Intent(getApplicationContext(), ShowResults.class);
                resultActivity.putExtra("data", text);
                startActivity(resultActivity);
            }
        });
    }

    private void blockButtons(final int count)
    {
        runOnUiThread(new Runnable()
        {
            @Override
            public void run()
            {
                if (!(count > buttons.size() || count < 0))
                {
                    for (Button button : buttons)
                    {
                        //button.setEnabled(false);
                        button.setVisibility(View.GONE);
                    }
                    for (int i = 0; i < count; i++)
                    {
                        //buttons.get(i).setEnabled(true);
                        buttons.get(i).setVisibility(View.VISIBLE);
                    }
                }
            }
        });
    }

    private String getJCodeField()
    {
        if (jcodeField.getText().toString().trim().length() > 8)
        {
            return "J";
        } else
        {
            StringBuilder sb = new StringBuilder();
            sb.append("J");
            sb.append(jcodeField.getText().toString());
            return sb.toString();
        }
    }

    private class FillData extends AsyncTask<String, String, String>
    {

        @Override
        protected String doInBackground(String... strings)
        {
            Connection connection = null;
            Statement statement = null;
            try
            {
                Class.forName(DBObject.JDBC_DRIVER);
                connection = DriverManager.getConnection(DBObject.DATABASE_URL, DBObject.connProps);
                statement = connection.createStatement();
                //
                goToResultActivity(DBObject.getProcessData(statement, selectedQuery));
            }
            catch (ClassNotFoundException e)
            {
                e.printStackTrace();
            }
            catch (SQLException e)
            {
                e.printStackTrace();
            }
            finally
            {
                DBObject.closeConnections(statement, connection);
            }
            return null;
        }
    }


    private class GetId extends AsyncTask<String, String, String>
    {

        @Override
        protected String doInBackground(String... strings)
        {
            Connection connection = null;
            Statement statement = null;
            try
            {
                Class.forName(DBObject.JDBC_DRIVER);
                connection = DriverManager.getConnection(DBObject.DATABASE_URL, DBObject.connProps);
                statement = connection.createStatement();
                //
                currentID = DBObject.findIDFromJCode(statement, getJCodeField());
                //
            }
            catch (ClassNotFoundException e)
            {
                e.printStackTrace();
            }
            catch (SQLException e)
            {
                e.printStackTrace();
            }
            finally
            {
                DBObject.closeConnections(statement, connection);
            }
            return null;
        }
    }

    private class CheckJCode extends AsyncTask<String, String, String>
    {

        @Override
        protected String doInBackground(String... strings)
        {
            Connection connection = null;
            Statement statement = null;
            try
            {
                Class.forName(DBObject.JDBC_DRIVER);
                connection = DriverManager.getConnection(DBObject.DATABASE_URL, DBObject.connProps);
                statement = connection.createStatement();
                blockButtons(DBObject.findFirstNull(statement, getJCodeField()));
            }
            catch (ClassNotFoundException e)
            {
                e.printStackTrace();
            }
            catch (SQLException e)
            {
                e.printStackTrace();
            }
            finally
            {
                DBObject.closeConnections(statement, connection);
            }
            return null;
        }
    }

    @Override
    public void onBackPressed()
    {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setMessage("You are going to log out. Are you sure?")
                .setCancelable(false).setPositiveButton("Yes", new DialogInterface.OnClickListener()
        {
            @Override
            public void onClick(DialogInterface dialog, int which)
            {
                Intent goBack = new Intent(getApplicationContext(), MainActivity.class);
                startActivity(goBack);
                finish();
            }
        }).setNegativeButton("No", new DialogInterface.OnClickListener()
        {
            @Override
            public void onClick(DialogInterface dialog, int which)
            {
                dialog.cancel();
            }
        });
        AlertDialog alert = builder.create();
        alert.show();
    }
}