FROM eclipse-temurin:17-jdk

COPY target/swm10.jar /user/app/

WORKDIR /user/app/

EXPOSE 9090

ENTRYPOINT [ "java", "-jar", "swm10.jar" ]