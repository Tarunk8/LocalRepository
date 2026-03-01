FROM almalinux:9
RUN yum install -y java-11-openjdk wget tar

WORKDIR /opt
ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.52/bin/apache-tomcat-10.1.52.tar.gz .

RUN tar -xvzf apache-tomcat-10.1.52.tar.gz && \
    mv apache-tomcat-10.1.52 tomcat

WORKDIR /opt/tomcat
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh","run"]
docker run -d -p 9191:8080 --name tomcat-container tomcat-app
