#!/bin/bash

export HADOOP_NAMENODE_HOST=${HADOOP_NAMENODE_HOST:-0.0.0.0}
export HADOOP_NAMENODE_PORT=${HADOOP_NAMENODE_PORT:-9000}
export HADOOP_TMP_DIR=${HADOOP_TMP_DIR:-/tmp/hadoop}
export HADOOP_DFS_NAMENODE_NAME_DIR=${HADOOP_DFS_NAMENODE_NAME_DIR:-/hadoop/namenode}
export HADOOP_DFS_DATANODE_DATA_DIR=${HADOOP_DFS_DATANODE_DATA_DIR:-/hadoop/datanode}
export HADOOP_DFS_REPLICATION=${HADOOP_DFS_REPLICATION:-2}
export HADOOP_DFS_PERMISSIONS=${HADOOP_DFS_PERMISSIONS:-false}
export HADOOP_YARN_RESOURCEMANAGER_HOST=${HADOOP_YARN_RESOURCEMANAGER_HOST:-0.0.0.0}
export HADOOP_YARN_HISTORYSERVER_INTERMEDIATE_DONE_DIR=${HADOOP_YARN_HISTORYSERVER_INTERMEDIATE_DONE_DIR:-/history/done_intermediate}
export HADOOP_YARN_HISTORYSERVER_DONE_DIR=${HADOOP_YARN_HISTORYSERVER_DONE_DIR:-/history/done}


echo "=========================================="
env
echo "=========================================="

echo "替换配置文件[$HADOOP_HOME/etc/hadoop/core-site.xml]"
sed -i "s|\${HADOOP_NAMENODE_HOST}|${HADOOP_NAMENODE_HOST}|g" $HADOOP_HOME/etc/hadoop/core-site.xml
sed -i "s|\${HADOOP_NAMENODE_PORT}|${HADOOP_NAMENODE_PORT}|g" $HADOOP_HOME/etc/hadoop/core-site.xml
sed -i "s|\${HADOOP_TMP_DIR}|${HADOOP_TMP_DIR}|g" $HADOOP_HOME/etc/hadoop/core-site.xml

echo "替换配置文件[$HADOOP_HOME/etc/hadoop/hdfs-site.xml]"
sed -i "s|\${HADOOP_DFS_NAMENODE_NAME_DIR}|${HADOOP_DFS_NAMENODE_NAME_DIR}|g" $HADOOP_HOME/etc/hadoop/hdfs-site.xml
sed -i "s|\${HADOOP_DFS_DATANODE_DATA_DIR}|${HADOOP_DFS_DATANODE_DATA_DIR}|g" $HADOOP_HOME/etc/hadoop/hdfs-site.xml
sed -i "s|\${HADOOP_DFS_REPLICATION}|${HADOOP_DFS_REPLICATION}|g" $HADOOP_HOME/etc/hadoop/hdfs-site.xml
sed -i "s|\${HADOOP_DFS_PERMISSIONS}|${HADOOP_DFS_PERMISSIONS}|g" $HADOOP_HOME/etc/hadoop/hdfs-site.xml

echo "替换配置文件[$HADOOP_HOME/etc/hadoop/yarn-site.xml]"
sed -i "s|\${HADOOP_YARN_RESOURCEMANAGER_HOST}|${HADOOP_YARN_RESOURCEMANAGER_HOST}|g" $HADOOP_HOME/etc/hadoop/yarn-site.xml

echo "替换配置文件[$HADOOP_HOME/etc/hadoop/mapred-site.xml]"
sed -i "s|\${HADOOP_YARN_HISTORYSERVER_INTERMEDIATE_DONE_DIR}|${HADOOP_YARN_HISTORYSERVER_INTERMEDIATE_DONE_DIR}|g" $HADOOP_HOME/etc/hadoop/mapred-site.xml
sed -i "s|\${HADOOP_YARN_HISTORYSERVER_DONE_DIR}|${HADOOP_YARN_HISTORYSERVER_DONE_DIR}|g" $HADOOP_HOME/etc/hadoop/mapred-site.xml

echo "启动sshd[/usr/sbin/sshd]"
/usr/sbin/sshd

if [ ! -d $HADOOP_TMP_DIR ]; then
    echo "创建目录[$HADOOP_TMP_DIR]"
    mkdir -p $HADOOP_TMP_DIR
fi
if [ ! -d $HADOOP_DFS_DATANODE_DATA_DIR ]; then
    echo "创建目录[$HADOOP_DFS_DATANODE_DATA_DIR]"
    mkdir -p $HADOOP_DFS_DATANODE_DATA_DIR
fi
if [ ! -d $HADOOP_YARN_HISTORYSERVER_TMP ]; then
    echo "创建目录[$HADOOP_YARN_HISTORYSERVER_TMP]"
    mkdir -p $HADOOP_YARN_HISTORYSERVER_TMP
fi
if [ ! -d $HADOOP_YARN_HISTORYSERVER_DONE ]; then
    echo "创建目录[$HADOOP_YARN_HISTORYSERVER_DONE]"
    mkdir -p $HADOOP_YARN_HISTORYSERVER_DONE
fi
