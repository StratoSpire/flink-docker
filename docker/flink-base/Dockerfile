FROM java:openjdk-8-jdk

MAINTAINER Ryan C Koch <ryanckoch@gmail.com>

RUN apt-get update && \
    apt-get install -y python-numpy && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV FLINK_VERSION="1.2.0" \
    FLINK_HOME="/opt/flink" \
    HADOOP_VERSION="2.7.3" \
    HADOOP_MAJOR_VERSION="27" \
    HADOOP_HOME="/opt/hadoop" \
    SCALA_VERSION="2.11"

# Get Hadoop from US Apache mirror and extract just the native
# libs. (Until we care about running HDFS with these containers, this
# is all we need.)
RUN mkdir -p /opt && \
    cd /opt && \
    curl http://archive.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz | \
        tar -zx hadoop-${HADOOP_VERSION}/lib/native && \
    mv hadoop-${HADOOP_VERSION} ${HADOOP_HOME} && \
    echo Hadoop ${HADOOP_VERSION} native libraries installed in ${HADOOP_HOME}/lib/native

# install flink
RUN cd /opt && \
    curl -L http://archive.apache.org/dist/flink/flink-${FLINK_VERSION}/flink-${FLINK_VERSION}-bin-hadoop${HADOOP_MAJOR_VERSION}-scala_${SCALA_VERSION}.tgz | \
        tar -zx && \
    mv flink-${FLINK_VERSION} ${FLINK_HOME} && \
    echo Flink ${FLINK_VERSION} installed in ${FLINK_HOME}

WORKDIR $FLINK_HOME

ENV PATH $PATH:$FLINK_HOME/bin

# ENV LD_LIBRARY_PATH "$HADOOP_HOME/lib/native"

#ENV FLINK_TM_CLASSPATH "$FLINK_HOME/lib/flink-dist_$SCALA_VERSION-$FLINK_VERSION.jar:$FLINK_HOME/lib/flink-python_$SCALA_VERSION-$FLINK_VERSION.jar:$FLINK_HOME/lib/flink-metrics-statsd-$FLINK_VERSION-hadoop1.jar:$FLINK_HOME/lib/slf4j-api-$SLF4J_VERSION.jar:$FLINK_HOME/lib/jcl-over-slf4j-$SLF4J_VERSION.jar:$FLINK_HOME/lib/jul-to-slf4j-$SLF4J_VERSION.jar"
ENV FLINK_TM_CLASSPATH="$FLINK_HOME/lib/flink-dist_$SCALA_VERSION-$FLINK_VERSION.jar:$FLINK_HOME/lib/flink-python_$SCALA_VERSION-$FLINK_VERSION.jar:$FLINK_HOME/lib/log4j-1.2.17.jar:$FLINK_HOME/lib/slf4j-log4j12-1.7.7.jar"


ADD conf/* $FLINK_HOME/conf/

EXPOSE 6121 6122 6123 8080 8081
