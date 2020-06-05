public class MaxTemperatureMapper extends Mapper<LongWritable, Text, Text, IntWritable>
{
    @Override
    public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException
    {
        String line = value.toString();
        context.write(new Text(year),newIntWritable(airTempear));
    }
}
