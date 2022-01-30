FROM openjdk:11
EXPOSE 8080
RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser
USER appuser
ADD my-app/target/my-app-1.0.1.jar my-app.jar
ENTRYPOINT [ "java","-jar","my-app.jar"]
