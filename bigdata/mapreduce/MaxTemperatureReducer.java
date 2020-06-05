public class MaxTemperatureReducer extends Reducer<Text,IntWritable,Text,IntWritable>{
    @Override
    public void reduce(Text key, Iterable<IntWritable> values, Context context) throws IOExcpetion, InterruptedExceptioni{
        int maxValue = 0;
        context.write(key,new IntWritable (maxValue));
    }
}
