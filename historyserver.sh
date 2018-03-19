#!/bin/bash

exec /env.sh

echo "启动historyserver[$HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh start historyserver &]"
$HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh start historyserver &

wait
