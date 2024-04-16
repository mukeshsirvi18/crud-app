# Use OpenJDK 11 as the base image
FROM openjdk:11-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file built by Maven to the working directory
COPY target/backend-spring-livelo.jar .

# Expose port 8080 (or the port your Spring Boot app listens on)
EXPOSE 8080

# Command to run the Spring Boot application
CMD ["java", "-jar", "backend-spring-livelo.jar"]
