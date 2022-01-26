FROM alpine:3.14

# copy the packaged jar file into our docker image
#COPY target/1.0-SNAPSHOT.jar /mymaven.jar
 
# set the startup command to execute the jar
CMD ["java", "-jar", "/mymaven.jar"]
