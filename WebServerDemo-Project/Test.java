import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.io.ImmutableBytesWritable;
import org.apache.hadoop.hbase.mapred.TableMapReduceUtil;
import org.apache.hadoop.hbase.mapreduce.TableReducer;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.JobConf;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.Reducer.Context;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.GenericOptionsParser;


public class PlaceCount {
    public static void main(String[] args) throws Exception {
        //Configuration conf = new Configuration();	//程序运行时参数
        Configuration conf=HBaseConfiguration.create();
        Connection conn=ConnectionFactory.createConnection(conf);
        Admin admin=conn.getAdmin();
        TableName tableName=TableName.valueOf("place");
        if(admin.tableExists(tableName)) {
        	System.out.println("table exists!");
        	admin.disableTable(tableName);
        	admin.deleteTable(tableName);
        }
        else {
        	HTableDescriptor hTableDescriptor=new HTableDescriptor(tableName);
        	HColumnDescriptor hColumnDescriptor=new HColumnDescriptor("content");
        	hTableDescriptor.addFamily(hColumnDescriptor);
        	admin.createTable(hTableDescriptor);
        }
    	String[] otherArgs = (new GenericOptionsParser(conf, args)).getRemainingArgs();
        if(otherArgs.length != 2) {
            System.err.println("Usage: wordcount <in><out>");
            System.exit(2);
        }
        Job job = Job.getInstance(conf, "place count");	//设置环境参数
        job.setJarByClass(PlaceCount.class);	//设置整个程序的类名
        job.setMapperClass(MyMapper.class);	//添加MyMapper类
        TableMapReduceUtil.initTableReduceJob("place",HbaseReducer.class,job);
        job.setOutputKeyClass(Text.class);	//设置输出类型
        job.setOutputValueClass(IntWritable.class);	//设置输出类型
        FileInputFormat.addInputPath(job, new Path(otherArgs[0]));	//设置输入文件
        System.exit(job.waitForCompletion(true)?0:1);
     }
 
    public static class HbaseReducer extends TableReducer<Text, IntWritable,NullWritable> {
        public void reduce(Text key, Iterable<IntWritable> values, Context context) throws IOException, InterruptedException {
            int sum = 0;
            for(IntWritable val:values) {
            	sum+=val.get();
            }
            Put put=new Put(key.getBytes());
            put.addColumn(Bytes.toBytes("content"),Bytes.toBytes("count"),Bytes.toBytes(sum));
            context.write(NullWritable.get(), put);
        }
    }
 
    public static class MyMapper extends Mapper<Object, Text, Text, IntWritable> {
        private static final IntWritable one = new IntWritable(1);
        private Text word = new Text();
        public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
        	String line=value.toString();
            String[] fields=line.split("\\s+");
            String goal=fields[6];
            this.word.set(goal);
            context.write(this.word,one);
        }
    }
}
