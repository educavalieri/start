FROM maven:3.8.3-openjdk-17 AS test
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests
FROM openjdk:17.0.1-jdk-slim AS prod
WORKDIR /application
COPY --from=test /app/target/*.jar /application/application.jar
CMD ["java", "-jar", "application.jar"]