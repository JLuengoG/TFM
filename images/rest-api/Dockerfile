FROM openjdk:11-jdk
#USER root
RUN mkdir /etc/zts
COPY conf/hbase-manager.properties /etc/zts/hbase-manager.properties
#USER jetty
RUN curl https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-runner/10.0.20/jetty-runner-10.0.20.jar -o jetty-runner.jar
COPY entrypoint.sh /
RUN chmod +x entrypoint.sh
EXPOSE 8081
ENTRYPOINT ["/entrypoint.sh"]
