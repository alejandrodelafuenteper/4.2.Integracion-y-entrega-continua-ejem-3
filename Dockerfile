FROM maven:3.9.0-eclipse-temurin-17 as builder
ADD ./pom.xml pom.xml
ADD ./src src/
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17.0.6_10-jre
COPY --from=builder /target/*.jar app.jar
CMD ["java", "-jar", "app.jar"] 