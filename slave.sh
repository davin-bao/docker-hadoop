#!/bin/bash

echo "创建slaves文件[$HADOOP_PREFIX/etc/hadoop/slaves]"
echo $(hostname) > $HADOOP_PREFIX/etc/hadoop/slaves

echo "启动datanode[$HADOOP_PREFIX/sbin/hadoop-daemons.sh --script hdfs start datanode &]"
$HADOOP_PREFIX/sbin/hadoop-daemons.sh --script hdfs start datanode &

echo "启动nodemanager[$HADOOP_YARN_HOME/sbin/yarn-daemons.sh start nodemanager &]"
$HADOOP_YARN_HOME/sbin/yarn-daemons.sh start nodemanager &

wait
