import java.util.HashMap;

public class MapTest
{
    public static void main(String args[])
    {
        HashMap<Integer,String> m = new HashMap<Integer,String>();
        m.put(123,"abc");
        m.put(456,"xyz");
        m.put(111,"abc");
        for(Integer key: m.keySet())
            {
                System.out.println("key  "+ key + "value = " + m.get(key));
            }
    }
}
