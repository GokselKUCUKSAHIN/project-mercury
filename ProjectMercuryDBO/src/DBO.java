import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

public class DBO
{

    //DBO = DataBaseObject
    static
    {
        //RUN THESE LINE FOR ONCE
        //System.out.println("SINGLE RUN TEST."); //debug
        try
        {
            checkDB(); //check for init
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    //
    private static Connection connection;
    private static Statement statement;
    private static boolean isInit = false;

    //
    private static void initDatabase() throws SQLException
    {
        String url = "jdbc:mysql://127.0.0.1:3306/Mercury";
        Properties connProps = new Properties();
        connProps.setProperty("user", "root");
        connProps.setProperty("password", "mysql123");
        connProps.setProperty("useSSL", "false");
        connProps.setProperty("serverTimezone", "UTC");
        connProps.setProperty("allowPublicKeyRetrieval", "true");
        //
        connection = DriverManager.getConnection(url, connProps);
        statement = connection.createStatement();
    }

    public static void checkDB() throws SQLException
    {
        if (!isInit)
        {
            initDatabase();
            isInit = true;
        }
    }

    public static ArrayList<String> test() throws SQLException
    {
        checkDB();
        //
        ArrayList<String> str = new ArrayList<>();
        String query = "select * from mercury.couch_table;"; //"select * from product;";

        ResultSet result = statement.executeQuery(query);
        ResultSetMetaData rsmd = result.getMetaData();

        while (result.next())
        {
            StringBuilder sb = new StringBuilder();
            for (int i = 1; i <= rsmd.getColumnCount(); i++)
            {
                sb.append(result.getString(i) + " \n");
            }
            str.add(sb.toString());
        }
        return str;
    }

    public static String getColumnName(int colId) throws SQLException
    {
        checkDB();
        //
        String query ="CALL SelectCouch(0);";
        ResultSet result = statement.executeQuery(query);
        ResultSetMetaData rsmd = result.getMetaData();
        return rsmd.getColumnName(colId);
    }
    public static int findFirstNull(int id) throws SQLException
    {
        checkDB();
        //
        String query = String.format("CALL SelectCouch(%d);", id);
        ResultSet result = statement.executeQuery(query);
        ResultSetMetaData rsmd = result.getMetaData();

        if (result.next())
        {
            for (int i = 3; i <= rsmd.getColumnCount(); i++)
            {
                if (result.getInt(i) == 1)
                {
                    // found empty field (null)

                    return i;
                }
            }
            return 0; // found but no empty fields
        } else
        {
            return -1; // there is no rows accourding this id
        }
    }
}
