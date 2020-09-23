### 使用命令行对调用hadoop api的java程序进行编译

#### hadoop版本：3.2.1

#### JAVA版本：11.0.8

#### Ubuntu18.0.4

使用当前目录中的 hadoop-javac 脚本来编译并运行java程序

使用方法：

首先修改hadoop-javac中的全局配置

```shell
# 全局配置 ---  global config --------------------------start

# hadoop 安装路径
export HADOOP_HOME="/usr/local/hadoop-3.2.1" #这里改成自己的hadoop的安装路径
# 初始化CLASSPATH 一般为空就行
export CLASSPATH=""
# hadoop 版本
export HADOOP_VERSION="3.2.1" #这里改成自己安装的hadoop的版本

# 全局配置 ---  global config --------------------------end
```

然后使用命令

```shell
/path/to/hadoop-javac /path/to/javafile/filename 
#注意这里的filename是去掉.java后缀后的名字. 如 hadoop.java,那么filename=hadoop
```

##### 注：目前只支持单文件

