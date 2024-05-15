FROM ubuntu:22.04
RUN apt-get update -y
RUN apt-get install -y openjdk-11-jdk-headless curl
RUN curl https://dlcdn.apache.org/hbase/2.4.17/hbase-2.4.17-bin.tar.gz -O
RUN tar xzf hbase-2.4.17-bin.tar.gz
RUN rm hbase-2.4.17-bin.tar.gz
RUN mv hbase-2.4.17 /opt/hbase
RUN mkdir /opt/hbase/logs
COPY conf/* /opt/hbase/conf
COPY entrypoint.sh /
COPY create-tables.sh /
RUN chmod +x entrypoint.sh create-tables.sh
ENV PATH="${PATH}:/opt/hbase/bin"
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
EXPOSE 2181
EXPOSE 16000
EXPOSE 16020
EXPOSE 16010
EXPOSE 16030
ENTRYPOINT ["/entrypoint.sh"]
