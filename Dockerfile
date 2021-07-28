FROM centos:7 as web
RUN yum install java-1.8.0 -y
RUN yum install git -y
RUN yum -y install maven
WORKDIR /mvnwebapp
RUN mvn package
FROM tomcat
COPY --from=web /mvnwebapp/target/mvnwebapp.war /usr/local/tomcat/webapps
EXPOSE 8080
