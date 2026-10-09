FROM eclipse-temurin:17-jdk

COPY target/swm10.jar /user/app/

WORKDIR /user/app/

EXPOSE 9090

ENTRYPOINT [ "java", "-jar", "swm10.jar" ]
# Build stage
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app
COPY pom.xml .
COPY src ./src

RUN mvn -B clean package -DskipTests

# Runtime stage
FROM eclipse-temurin:17-jre

WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

EXPOSE 9090

ENTRYPOINT ["java", "-jar", "app.jar"]
