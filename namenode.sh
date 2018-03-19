#!/bin/bash

exec /env.sh

if [ ! -d $HADOOP_DFS_NAMENODE_NAME_DIR ]; then
    echo "创建文件夹[$HADOOP_DFS_NAMENODE_NAME_DIR]"
    mkdir -p $HADOOP_DFS_NAMENODE_NAME_DIR
    echo "格式化hdfs目录[$HADOOP_PREFIX/bin/hdfs namenode -format cluster1]"
    $HADOOP_PREFIX/bin/hdfs namenode -format cluster1
elif [ "`ls -A $HADOOP_DFS_NAMENODE_NAME_DIR`" = "" ]; then
    echo "格式化hdfs目录[$HADOOP_PREFIX/bin/hdfs namenode -format cluster1]"
    $HADOOP_PREFIX/bin/hdfs namenode -format cluster1
fi

echo "启动namenode[$HADOOP_PREFIX/sbin/hadoop-daemon.sh --script hdfs start namenode &]"
$HADOOP_PREFIX/sbin/hadoop-daemon.sh --script hdfs start namenode

wait
