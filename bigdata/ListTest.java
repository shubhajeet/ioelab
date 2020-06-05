import java.util.ArrayList;

public class ListTest
{
    public static void main(String args[])
    {
        ArrayList<String> l = new ArrayList<String>();
        l.add("abc");
        l.add("xyz");
        l.add("abc");
        for(String val:l)
            {
                System.out.println(val);
            }
    }
}
