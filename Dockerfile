FROM hub.c.163.com/library/tomcat
MAINTAINER ming/docker-web
COPY target/web_ssm-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps
EXPOSE 8080