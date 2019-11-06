import java.util.Scanner;

public class Main
{

    public static void main(String[] args)
    {

        /*for (int i = 0; i < 20; i++)
        {
            System.out.println("JCode = '" + jCode(Utils.getRandomInt(100000, 999999)) + "'");
        }*/


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
            String code = jCode(val);
            System.out.println("JCode = '" + code + "'");
            System.out.println(isGenuineJCode(code));
        }
    }

    private static String jCode(int seed)
    {
        StringBuilder sb = new StringBuilder(9);
        sb.append('J'); // Always starts with J
        String str = Integer.toString(seed); // int to string
        int sum = 0;
        if (str.length() >= 6)
        {
            // exact size
            for (int i = 0; i < 6; i++)
            {
                sb.append(str.charAt(i)); // append all digits to string builder
                sum += Integer.parseInt(Character.toString(str.charAt(i)));
            }
        } else
        {
            // under
            // fill with 0's
            for (int i = 0; i < 6 - str.length(); i++)
            {
                sb.append("0"); // fill spaces with 0's
            }
            for (int i = 0; i < str.length(); i++)
            {
                sb.append(str.charAt(i)); // append that character to stringbuilder.
                sum += Integer.parseInt(Character.toString(str.charAt(i))); // get chatAt i th index and add
            }
        }
        sb.append(String.format("%02d", sum)); // 02 = 2 digit and if less than 2 digit fill with 0
        return sb.toString();
    }

    private static boolean isGenuineJCode(String code)
    {
        if (code.length() == 9)
        {
            if (code.charAt(0) == 'J')
            {
                // if Starts with 'J'
                int sum = 0;
                for (int i = 1; i < code.length() - 2; i++)
                {
                    sum += Integer.parseInt(Character.toString(code.charAt(i))); // check sum
                }
                return sum == Integer.parseInt(code.substring(7, 9)); // last 2 digits is same as check sum
            } else
            {
                // Must be J if isn't it's not genuine
                return false;
            }
        } else
        {
            // it must be exactly 9 digits
            return false;
        }
    }
}
