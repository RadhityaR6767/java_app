FROM openjdk:22-slim-bullseye

WORKDIR /app

COPY target/<<ARTIFACTID>>-<<VERSION>>.jar my-app.jar

CMD ["java", "-jar", "my-app.jar"]
