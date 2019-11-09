import java.util.Scanner;

public class JCode
{
    private static String GenerateJCode(int seed)
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
                try
                {
                    // it can be like 'Jellybean' its 9 digit and starting with J but not a JCode;
                    for (int i = 1; i < code.length() - 2; i++)
                    {
                        sum += Integer.parseInt(Character.toString(code.charAt(i))); // check sum
                    }
                    return sum == Integer.parseInt(code.substring(7, 9)); // last 2 digits is same as check sum
                }
                catch (Exception ex)
                {
                    // then its not genuine
                    return  false;
                }
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
