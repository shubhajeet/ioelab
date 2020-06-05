public class MaxTemperature{
    public static void main(String[] args) throws Exceptiions{
        Job job = new Job();
        job.setJarByClass(MaxTemperature.class);
        job.setJobName("max temperature");

        FileInputFormat.addInputPath(job, new Path("guide/temperature.txt"));
        FileOutputFormat.setOutput(job, new Path("guide/max"));

        job.setInputFormatClass(TextInputFormat.class);

        job.setMapperClass(MaxTemperatureMapper.class);
        job.setMapperClass(MaxTemperatureMapper.class);

        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(IntWritable.class);

        System.exit(job.waitForCompletion(true)?0:1);

    }
}
