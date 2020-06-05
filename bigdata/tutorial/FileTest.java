import java.io.*;
public class FileTest
{
    public static void main(String args[])
    {
        try{
            BufferedReader br = new BufferedReader(new FileReader(new File("file.csv")));
            String line = "";
            while((line=br.readLine()) != null)
                {
                    System.out.println(line);
                }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
