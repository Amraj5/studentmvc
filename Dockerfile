FROM eclipse-temurin:23-jdk-alpine

WORKDIR /app

# Copy Maven configuration
COPY pom.xml .

# Copy source code
COPY src ./src

# Build the Spring Boot application
RUN mvn clean package -DskipTests


# ==============================
# Stage 2: Run the application
# ==============================
FROM eclipse-temurin:23-jdk-alpine

WORKDIR /app

# Copy the generated JAR
COPY --from=build /app/target/studentmvc-0.0.1-SNAPSHOT.jar app.jar

# Start Spring Boot
CMD ["java", "-jar", "app.jar"]
