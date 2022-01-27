FROM openjdk:11
EXPOSE 8080
ADD /home/runner/.m2/repository/com/mycompany/app/my-app/1.0-SNAPSHOT/my-app-1.0-SNAPSHOT.jar 1.0-SNAPSHOT.jar
ENTRYPOINT [ "java","-jar","/1.0-SNAPSHOT.jar"]