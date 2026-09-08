# ---- Build stage (Maven + JDK 23) ----
FROM maven:3.9-eclipse-temurin-23 AS build
WORKDIR /app
# Copy the whole project (pom.xml + src + any other files)
COPY . .
# Run Maven build (skip tests for speed)
RUN mvn clean package -DskipTests

# ---- Runtime stage (just JDK 23) ----
FROM eclipse-temurin:23-jdk-alpine
WORKDIR /app
# Copy the generated JAR (use wildcard to avoid name mismatches)
COPY --from=build /app/target/*.jar app.jar
# Expose the default Spring Boot port (optional)
EXPOSE 8080
# Run the app
CMD ["java", "-jar", "app.jar"]
