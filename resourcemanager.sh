#!/bin/bash

exec /env.sh

echo "启动resourcemanager[$HADOOP_YARN_HOME/sbin/yarn-daemon.sh start resourcemanager]"
$HADOOP_YARN_HOME/sbin/yarn-daemon.sh start resourcemanager &

wait
