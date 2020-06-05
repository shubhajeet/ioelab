import java.io.*;
import java.util.HashMap;

public class artist
{
    public static void main(String args[])
    {
        
        HashMap<String,HashMap<String,Integer>> map
            = new HashMap<String,HashMap<String,Integer>>();
        try
            {
                BufferedReader reader = new BufferedReader(new FileReader(new File("tracks_per_year.txt")));
                String line = "";
                while((line=reader.readLine()) != null)
                    {
                        String values[] = line.split("<SEP>");
                        String read_year = values[0];
                        String name = values[2];
        
                        if (map.containsKey(name))
                            {
                                HashMap<String,Integer> year_map = map.get(name);
                                if (year_map.containsKey(read_year))
                                    {
                                        year_map.put(read_year,year_map.get(read_year)+1);
                                    }
                                else
                                    {
                                        year_map.put(read_year,1);
                                    }
                                    
                            }
                        else
                            {
                                HashMap<String,Integer> year_map = new HashMap<String,Integer>();
                                year_map.put(read_year,1);
                                map.put(name,year_map);
                            }
                    }
                for(String artist : map.keySet())
                    {
                        System.out.println("Artist " +artist);
                        HashMap<String,Integer> year_map = map.get(artist);
                        for(String year: year_map.keySet())
                            {
                                System.out.println("Year" + year + " " + " Count " + year_map.get(year));   
                            }
                    }
            }
        catch(Exception ex)
            {
                ex.printStackTrace();
            }
        
    }

}
