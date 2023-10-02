FROM maven:3-amazoncorretto-20 as build
WORKDIR /app
COPY pom.xml ./
RUN mvn dependency:resolve
COPY src ./src

RUN mvn package

FROM eclipse-temurin:17-jre-jammy as production
WORKDIR /app
EXPOSE 8080

COPY --from=build /app/target/*.jar /app.jar

CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app.jar"]






