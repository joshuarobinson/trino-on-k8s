FROM openjdk:8-slim

ARG HADOOP_VERSION=3.2.0

RUN apt-get update && apt-get install -y curl --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

# Download and extract the Hadoop binary package.
RUN curl https://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz \
	| tar xvz -C /opt/  \
	&& ln -s /opt/hadoop-$HADOOP_VERSION /opt/hadoop \
	&& rm -r /opt/hadoop/share/doc 

# Add S3a jars to the classpath using this hack.
RUN ln -s /opt/hadoop/share/hadoop/tools/lib/hadoop-aws* /opt/hadoop/share/hadoop/common/lib/ && \
    ln -s /opt/hadoop/share/hadoop/tools/lib/aws-java-sdk* /opt/hadoop/share/hadoop/common/lib/

# Set necessary environment variables. 
ENV HADOOP_HOME="/opt/hadoop"
ENV PATH="/opt/spark/bin:/opt/hadoop/bin:${PATH}"

# Download and install the standalone metastore binary.
RUN curl http://apache.uvigo.es/hive/hive-standalone-metastore-3.0.0/hive-standalone-metastore-3.0.0-bin.tar.gz \
	| tar xvz -C /opt/ \
	&& ln -s /opt/apache-hive-metastore-3.0.0-bin /opt/hive-metastore

# Download and install the mysql connector.
RUN curl -L https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.47.tar.gz \
	| tar xvz -C /opt/ \
	&& ln -s /opt/mysql-connector-java-5.1.47/mysql-connector-java-5.1.47.jar /opt/hadoop/share/hadoop/common/lib/ \
	&& ln -s /opt/mysql-connector-java-5.1.47/mysql-connector-java-5.1.47.jar /opt/hive-metastore/lib/ 
