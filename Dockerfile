FROM eclipse-temurin:21-jdk AS build
WORKDIR /app

COPY EVMBackend/.mvn EVMBackend/.mvn
COPY EVMBackend/mvnw EVMBackend/pom.xml ./EVMBackend/
COPY EVMBackend/src EVMBackend/src

WORKDIR /app/EVMBackend
RUN chmod +x mvnw && ./mvnw clean package -DskipTests

FROM eclipse-temurin:21-jre
WORKDIR /app

COPY --from=build /app/EVMBackend/target/EVMBackend-0.0.1-SNAPSHOT.jar app.jar

ENV PORT=8080
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]