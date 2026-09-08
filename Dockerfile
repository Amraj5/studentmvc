FROM eclipse-temurin:23-jdk-alpine AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:23-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/studentmvc-0.0.1-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]
