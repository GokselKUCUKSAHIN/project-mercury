import java.sql.*;
import java.time.LocalDate;
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
        String query = "select * from product;";
        ResultSet result = statement.executeQuery(query);
        while (result.next())
        {
            StringBuilder sb = new StringBuilder();
            for (int i = 1; i < 5; i++)
            {
                sb.append(result.getString(i));
            }
            str.add(sb.toString());
        }
        return str;
    }

}
