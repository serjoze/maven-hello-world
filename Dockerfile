FROM openjdk:11
EXPOSE 8080
ADD my-app/target/my-app-1.0.1.jar my-app.jar
ENTRYPOINT [ "java","-jar","my-app.jar"]
