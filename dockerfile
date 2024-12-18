# tomcat-student-ui-form dockerfile
FROM amazonlinux
LABEL maintainer="Abhijit Ramteke<abhijitramteke345@gmail.com>"
RUN yum update -y && yum install -y java-17-amazon-corretto.x86_64 -y && yum install -y unzip && yum install -y wget
RUN wget https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.1/bin/apache-tomcat-11.0.1.zip
RUN unzip apache-tomcat-11.0.1
RUN mv apache-tomcat-10.1.28 /mnt/tomcat/
RUN chmod 770 /mnt/tomcat/bin/catalina.sh
COPY . /app
WORKDIR /app
RUN mvn clean package
RUN cp target/*.war /mnt/tomcat/webapps/student.war
EXPOSE 8080
CMD ["/mnt/tomcat/bin/catalina.sh", "run"]
