import java.io.*;
import java.util.HashMap;

public class wordCount
{
    public static void main(String args[])
    {
        
        HashMap<String,Integer> map
            = new HashMap<String,Integer>();
        try
            {
                BufferedReader reader = new BufferedReader(new FileReader(new File(args[0])));
                String line = "";
                while((line=reader.readLine()) != null)
                    {
                        String words[] = line.split(" ");
                        for (String word:words)
                            {
                                if (map.containsKey(word))
                                    {
                                        map.put(word,map.get(word)+1);
                                    
                                    }
                                else
                                    {
                                        map.put(word,1);
                                    }
                            }
                    }
                for(String word : map.keySet())
                    {
                        System.out.println("Word " +word);
                        Integer count = map.get(word);
                        System.out.println(" Count " +count); 
                    }
            }
        catch(Exception ex)
            {
                ex.printStackTrace();
            }
        
    }

}
