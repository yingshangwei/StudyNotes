import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.mapreduce.TableMapReduceUtil;
import org.apache.hadoop.hbase.mapreduce.TableReducer;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;

public class ReadHDFSDataToHbaseMR extends Configured implements Tool{

    public static void main(String[] args) throws Exception {
        
        int run = ToolRunner.run(new ReadHDFSDataToHbaseMR(), args);
        System.exit(run);
    }

    @Override
    public int run(String[] arg0) throws Exception {

        Configuration conf = HBaseConfiguration.create();
        conf.set("fs.defaultFS", "hdfs://myha01/");
        conf.set("hbase.zookeeper.quorum", "hadoop1:2181,hadoop2:2181,hadoop3:2181");
        System.setProperty("HADOOP_USER_NAME", "hadoop");
        FileSystem fs = FileSystem.get(conf);
//        conf.addResource("config/core-site.xml");
//        conf.addResource("config/hdfs-site.xml");
        
        Job job = Job.getInstance(conf);
        
        job.setJarByClass(ReadHDFSDataToHbaseMR.class);
        
        job.setMapperClass(HDFSToHbaseMapper.class);
        job.setMapOutputKeyClass(Text.class);
        job.setMapOutputValueClass(NullWritable.class);

        TableMapReduceUtil.initTableReducerJob("student", HDFSToHbaseReducer.class, job,null,null,null,null,false);
        job.setOutputKeyClass(NullWritable.class);
        job.setOutputValueClass(Put.class);
        
        Path inputPath = new Path("/student/input/");
        Path outputPath = new Path("/student/output/");
        
        if(fs.exists(outputPath)) {
            fs.delete(outputPath,true);
        }
        
        FileInputFormat.addInputPath(job, inputPath);
        FileOutputFormat.setOutputPath(job, outputPath);
        
        boolean isDone = job.waitForCompletion(true);
        
        return isDone ? 0 : 1;
    }
    
    
    public static class HDFSToHbaseMapper extends Mapper<LongWritable, Text, Text, NullWritable>{
        
        @Override
        protected void map(LongWritable key, Text value, Context context)
                throws IOException, InterruptedException {    
            context.write(value, NullWritable.get());
        }
        
    }
    
    /**
     * 95015,王君,男,18,MA
     * */
    public static class HDFSToHbaseReducer extends TableReducer<Text, NullWritable, NullWritable>{
        
        @Override
        protected void reduce(Text key, Iterable<NullWritable> values,Context context)
                throws IOException, InterruptedException {
            
            String[] split = key.toString().split(",");
            
            Put put = new Put(split[0].getBytes());
            
            put.addColumn("info".getBytes(), "name".getBytes(), split[1].getBytes());
            put.addColumn("info".getBytes(), "sex".getBytes(), split[2].getBytes());
            put.addColumn("info".getBytes(), "age".getBytes(), split[3].getBytes());
            put.addColumn("info".getBytes(), "department".getBytes(), split[4].getBytes());
            
            context.write(NullWritable.get(), put);
        
        }
        
    }
    
}