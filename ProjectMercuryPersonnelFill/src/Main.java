import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class Main
{

    public static void main(String[] args) throws FileNotFoundException
    {
        for (int i = 0; i < 100; i++)
        {
            System.out.println(createDates(1970, 2000));
        }
        System.out.println(createTC());
        ArrayList<String> names = loadDataFromTxt("TXT/name.txt");
        ArrayList<String> surnames = loadDataFromTxt("TXT/surname.txt");
        //
        for (int i = 0; i < names.size(); i++)
        {
            System.out.printf("insert into mercury.personnel_table values (null, '%s', '%s', '%s', '%s', '%s');\n",
                    names.get(i), surnames.get(i), createTC(), createDates(1990, 2010), createDates(1960, 1990));
        }
    }

    static ArrayList<String> loadDataFromTxt(String path) throws FileNotFoundException
    {
        //String path = "TXT/name.txt"; //res/data.txt //default
        ArrayList<String> rows = new ArrayList<>();
        File file = new File(path);
        Scanner scanner = new Scanner(file);
        while (scanner.hasNextLine())
        {
            //Scan everyline and append to arrayList
            String readLine = scanner.nextLine();
            readLine = readLine.trim();
            rows.add(readLine);
        }
        return rows;
    }

    static String createTC()
    {
        int seed = Utils.getRandomInt(100000000, 999999999);
        String tc = Integer.toString(seed);
        int odd = 0;
        int even = 0;
        for (int i = 0; i < tc.length(); i++)
        {
            if (i % 2 == 0)
            {
                //odd
                odd += Character.getNumericValue(tc.charAt(i));
            } else
            {
                //even
                even += Character.getNumericValue(tc.charAt(i));
            }
        }
        odd = (odd * 7 - even) % 10;
        tc += Integer.toString(odd);
        int sum = 0;
        for (int i = 0; i < tc.length(); i++)
        {
            sum += Character.getNumericValue(tc.charAt(i));
        }
        tc += Integer.toString(sum % 10);
        return tc;
    }

    static String createDates(int minYear, int maxYear)
    {
        //YYYY-MM-DD
        if (minYear < 1900 || maxYear > 2020)
        {
            return "2000-1-1";
        } else
        {
            int year = Utils.getRandomInt(minYear, maxYear);
            int month = Utils.getRandomInt(1, 13);
            int day = Utils.getRandomInt(1, 28);
            return String.format("%d-%d-%d", year, month, day);
        }
    }
}