FROM openjdk:11
EXPOSE 8080
ADD target/my-app-1.0-SNAPSHOT.jar 1.0-SNAPSHOT.jar
ENTRYPOINT [ "java","-jar","/1.0-SNAPSHOT.jar"]