FROM eclipse-temurin:17

WORKDIR /

EXPOSE 80

COPY Package ./

CMD ["./mvnw", "spring-boot:run"]