# cbz-student-ui   steps for buildinding   

***tomcat deploy and  student_ ui  application requrnment

# 1.on ubuntu
#search pkg for java by $apt-cache search openjdk 

#select and download suitable  11 version pkg

2.install tomcat specified version like 9 on google $wget (pkg link)

3.unzip it

4.mv it $ mv (tomcat pkg) /mnt/pkg with rename in tomcat for understanding 

5.give permision to the catalina.sh $ chmod 770 /mnt/tomcat/bin/catalina.sh

6)and start it $./catalina.sh start  [after going bin dir ]  -or[/mnt/tomcat/bin/./catalina.sh start ]-->without going to the path

7) hit port 8080 

#NOw deploy student_ui aplication  [maven home dir ---/usr /share/maven
by using maven to artifact your aplication .

1)$apt install maven  -y

2)git clone (student-ui) from particular git repo

3)cd student-ui

4)$ mvn clean package 

5)cd target

6)mv student-2.2-SNAPSHOT.war /mnt/tomcat/webapps/student.war
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ***TOmcat deployment on centos linux 

1)yum list |grep java   (search package to installl java)

2)yum install (yum install java-17-amazon-corretto.x86_64 -y)

3)wget (tomcat package 9)

4)unzip (package tomcat)

5)mv /mnt/tomcat

6)chmod 775 /mnt/tomat/bin/catalina.sh 

7) ./catalina.sh start

8)yum install git -y

9)git clone https://github.com/abhijit06021997/student-ui.git

10)yum install maven -y

11)cd student-ui

12)yum install maven -y

13)mvn clean package

14)cd target

15)mv student-2.2-SNAPSHOT.war /mnt/tomcat/webapps/student.war

16)then hit ip:8080/student.war
========================================================================================================
#**Tomcat deploy Dockerfile on centos 

FROM amazonlinux
RUN yum update -y && yum install -y java-17-amazon-corretto.x86_64 -y && yum install -y unzip && yum install -y wget
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.90/bin/apache-tomcat-9.0.90.zip
RUN unzip apache-tomcat-9.0.90.zip
RUN mv apache-tomcat-9.0.90 /mnt/tomcat/
RUN chmod 770 /mnt/tomcat/bin/catalina.sh
CMD ["/mnt/tomcat/bin/catalina.sh", "run"]
EXPOSE 8080                                  			
=====================================================================================================
##Deploy tomcat with student-ui app (need student-ui code from git repo)           

FROM amazonlinux
LABEL maintainer="Abhijit Ramteke<abhijitramteke345@gmail.com>"
RUN yum update -y && yum install -y java-17-amazon-corretto.x86_64 -y && yum install -y unzip && yum install -y wget
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.28/bin/apache-tomcat-10.1.28.zip
RUN unzip apache-tomcat-10.1.28
RUN mv apache-tomcat-10.1.28 /mnt/tomcat/
RUN chmod 770 /mnt/tomcat/bin/catalina.sh
COPY . /app
WORKDIR /app
RUN mvn clean package
RUN cp target/*.war /mnt/tomcat/webapps/student.war
EXPOSE 8080
CMD ["/mnt/tomcat/bin/catalina.sh", "run"]				



#hit on port/student     for application access
