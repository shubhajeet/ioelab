import java.io.*;
import java.util.HashMap;

public class inyear
{
    public static void main(String args[])
    {
        String year = args[0];
        HashMap<String,Integer> map = new HashMap<String,Integer>();
        try
            {
                BufferedReader reader = new BufferedReader(new FileReader(new File("tracks_per_year.txt")));
                String line = "";
                while((line=reader.readLine()) != null)
                    {
                        String values[] = line.split("<SEP>");
                        String read_year = values[0];
                        String name = values[2];
                        if (year.equals(read_year))
                            {
                                if (map.containsKey(name))
                                    {
                                        map.put(name,map.get(name)+1);
                                    }
                                else
                                    {
                                        map.put(name,1);
                                    }
                            }
                    }
                for(String artist : map.keySet())
                    {
                        System.out.println(artist + " " + map.get(artist));
                    }
            }
        catch(Exception ex)
            {
                ex.printStackTrace();
            }
        
    }

}
