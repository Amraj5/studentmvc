FROM eclipse-temurin:23-jdk-alpine AS build   # <-- name this stage "build"

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# ==============================
# Stage 2: Run the application
# ==============================
FROM eclipse-temurin:23-jdk-alpine

WORKDIR /app

# Now this works because "build" is a known stage
COPY --from=build /app/target/studentmvc-0.0.1-SNAPSHOT.jar app.jar

CMD ["java", "-jar", "app.jar"]
