FROM 192.168.189.47:5000/hadoop-base:latest

ENV HADOOP_HOME=/usr/local/hadoop-2.7.2 \
    HADOOP_YARN_HOME=/usr/local/hadoop-2.7.2 \
    HADOOP_PREFIX=/usr/local/hadoop-2.7.2 \
    HADOOP_CONF_DIR=/usr/local/hadoop-2.7.2/etc/hadoop \
    PATH=/usr/local/hadoop-2.7.2/bin:$PATH

COPY hadoop-2.7.2 $HADOOP_HOME
COPY *.sh /

RUN chmod 755 /*.sh \
&& chmod 755 $HADOOP_HOME/bin/* \
&& chmod 755 $HADOOP_HOME/sbin/*
