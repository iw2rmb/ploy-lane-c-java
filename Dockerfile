FROM maven:3.9.8-eclipse-temurin-21 AS build
WORKDIR /src
COPY pom.xml .
RUN mvn -q -e -DskipTests dependency:go-offline || true
COPY src ./src
RUN mvn -q -DskipTests package

FROM eclipse-temurin:21-jre
ENV PORT=8080
EXPOSE 8080
COPY --from=build /src/target/hello-1.0.0.jar /app/app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]
