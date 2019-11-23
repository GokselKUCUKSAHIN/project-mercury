import java.sql.SQLException;
import java.util.ArrayList;

public class Main
{

    public static void main(String[] args)
    {
        ArrayList<String> rs = new ArrayList<>();
        try
        {
            rs = DBO.test();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        for (String str : rs)
        {
            System.out.println(str);
        }

    }
}
