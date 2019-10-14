FROM ubuntu:18.10
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
COPY runTomcat.sh /usr/local/bin
RUN ["chmod","+x","/usr/local/bin/runTomcat.sh"]
WORKDIR /opt
ADD http://apachemirror.wuchna.com/tomcat/tomcat-9/v9.0.26/bin/apache-tomcat-9.0.26.tar.gz .
RUN gunzip apache-tomcat-9.0.26.tar.gz
RUN tar -xvf apache-tomcat-9.0.26.tar
RUN rm apache-tomcat-9.0.26.tar
RUN apt-get install -y curl
COPY store.war /opt/apache-tomcat-9.0.26/webapps
RUN ["chmod","+x","/opt/apache-tomcat-9.0.26/webapps/BasicWeb.war"]
EXPOSE 8080
ENTRYPOINT [ "runTomcat.sh" ]
HEALTHCHECK CMD curl -f http://localhost:8080 || exit 1
CMD [ "tail -f /dev/null" ]
