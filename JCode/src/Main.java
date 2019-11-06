import java.util.Scanner;

public class Main
{

    public static void main(String[] args)
    {

        for (int i = 0; i < 20; i++)
        {
            System.out.println("JCode = '" + jCode(Utils.getRandomInt(100000, 999999)) + "'");
        }


        Scanner scanner = new Scanner(System.in);
        int val = 0;
        while (true)
        {
            val = 0;
            System.out.print("Enter a value->");
            try
            {
                val = Integer.parseInt(scanner.nextLine());
            }
            catch (Exception ex)
            {
                System.out.println("err");
                val = 0;
            }
            System.out.println("JCode = '" + jCode(val) + "'");
        }
    }

    private static String jCode(int seed)
    {
        StringBuilder sb = new StringBuilder(9);
        sb.append('J'); // Always starts with J
        String str = Integer.toString(seed);
        int sum = 0;
        if (str.length() >= 6)
        {
            // exact size
            for (int i = 0; i < 6; i++)
            {
                sb.append(str.charAt(i));
                sum += Integer.parseInt(Character.toString(str.charAt(i)));
            }
        } else
        {
            // under
            // fill with 0's
            for (int i = 0; i < 6 - str.length(); i++)
            {
                sb.append("0");
            }
            for (int i = 0; i < str.length(); i++)
            {
                sb.append(str.charAt(i));
                sum += Integer.parseInt(Character.toString(str.charAt(i)));
            }
        }
        sb.append(String.format("%02d", sum));
        return sb.toString();
    }
}
