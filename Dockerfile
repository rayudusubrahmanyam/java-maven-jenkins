FROM openjdk:8-jre-alpine
COPY target/java-maven-jenkins-2.0-SNAPSHOT.jar /app
EXPOSE 8080
WORKDIR /app
CMD ["java -jar java-maven-jenkins-2.0-SNAPSHOT.jar"]
