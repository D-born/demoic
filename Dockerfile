FROM eclipse-temurin:8-jre

WORKDIR /app

COPY target/DemoIC-0.0.1-SNAPSHOT.jar ./app.jar

CMD ["java", "-jar", "app.jar"]
