package com.example.projectmercury;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DBObject
{

    //private static Connection connection;
    //  private static Statement statement;
    //private static boolean isInit = false;
    static final Properties connProps = new Properties();
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DATABASE_URL = "jdbc:mysql://192.168.43.37:3306/mercury";  //change your dp address

    //DBO = DataBaseObject
    static
    {
        connProps.setProperty("user", "superuser");
        connProps.setProperty("password", "jellybeanci");
        connProps.setProperty("useSSL", "false");
        connProps.setProperty("serverTimezone", "UTC");
        connProps.setProperty("allowPublicKeyRetrieval", "true");
    }

    public static void closeConnections(Statement statement, Connection connection)
    {
        try
        {
            if (statement != null)
            {
                statement.close();
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        try
        {
            if (connection != null)
            {
                connection.close();
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    //GAZOZUNA BİLE CODE YAZIYOR OLASANIZ BİLE ŞİFRELERİ PLAİN TEXT OLARAK SAKLAMAYIN.
    public static String hashFunctionGenerator(String stringForEncode)
    {
        MessageDigest digest = null;
        try
        {
            digest = MessageDigest.getInstance("SHA-256");
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace(); //it means somethings went really wrong.
        }
        byte[] hash = digest.digest(stringForEncode.getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(hash);
    }

    public static int logInUser(Statement statement, String username, String password) throws SQLException
    {
        //checkDB();
        //
        String regex = "[A-Za-z0-9 #$&!*?]{3,20}"; //tested
        int id = -1;
        if (username.matches(regex))
        {
            String hashedPassword = hashFunctionGenerator(password);
            String sql = String.format("CALL CheckMobilPassword('%s','%s');", username, hashedPassword);
            ResultSet rs = statement.executeQuery(sql);
            if (rs.next())
            {
                id = rs.getInt(1);
            }
        }
        return id;
    }

    public static String signUpUser(Statement statement, String username, String pass1, String pass2) throws SQLException
    {
        //checkDB();
        String regex = "[A-Za-z0-9 #$&!*?]{3,20}"; //tested

        if (!username.equals("") && !pass1.equals("") && !pass1.equals("") && !username.equals("-1"))
        {
            if (!username.matches(regex))
            {
                return "Illegal Charter in User Name";
            } else if (pass1.equals(pass2))
            {
                String query = String.format("CALL CheckMobilUser('%s');", username);
                ResultSet rs = statement.executeQuery(query);
                if (!rs.next())
                {
                    String hashedPass = hashFunctionGenerator(pass1);
                    query = String.format("CALL AddNewMobilUser('%s','%s');", username, hashedPass);
                    statement.executeUpdate(query);
                    return "Sign Up Succesfull";
                } else
                {
                    return "This username already in use";
                }
            } else
            {
                return "Passwords doesn't match";
            }
        } else
        {
            return "Check all fields!";
        }
    }


    public static String getProcessData(Statement statement, String query) throws SQLException
    {
        StringBuilder sb = new StringBuilder();
        ResultSet result = statement.executeQuery(query);
        ResultSetMetaData rsmd = result.getMetaData();
        if (result.next())
        {
            for (int i = 1; i <= rsmd.getColumnCount(); i++)
            {
                sb.append(String.format("%s\n%s\n", rsmd.getColumnLabel(i), result.getString(i)));
            }
        }
        return sb.toString();
    }

    public static int findIDFromJCode(Statement statement, String jCode) throws SQLException
    {
        if (jCode.length() > 9)
        {
            return -1;
        } else
        {
            String query = String.format("CALL mercury.CheckJcode('%s');", jCode);
            ResultSet result = statement.executeQuery(query);
            if (result.next())
            {
                return result.getInt(1);
            } else
            {
                return -1;
            }
        }
    }

    public static int findFirstNull(Statement statement, String jCode) throws SQLException
    {
        //System.out.println(jCode);
        String query = String.format("CALL mercury.SelectJCode('%s');", jCode);

        ResultSet result = statement.executeQuery(query);
        //System.out.println("after SQL");
        ResultSetMetaData rsmd = result.getMetaData();
        //System.out.println("after META DATA SQL");

        if (result.next())
        {
            for (int i = 3; i <= rsmd.getColumnCount(); i++)
            {
                if (result.getInt(i) == 1)
                {
                    // found empty field (null)
                    return i - 3;
                }
            }
            return 15; // found but no empty fields
        } else
        {
            return 0; // there is no rows accourding this id
        }
    }
}