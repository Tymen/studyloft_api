FROM maven:3.9.9-eclipse-temurin-23-alpine
RUN addgroup -g 546 login-api && \
    adduser -D -u 546 -G login-api login-api && \
    mkdir -p /var/lib/studyloft_api && \
    chown login-api /var/lib/studyloft_api
USER login-api
ADD target/*.jar /var/lib/studyloft_api/studyloft_api.jar

ENV ENVIRONMENT=local

EXPOSE 8090
ENTRYPOINT exec java -jar -Dspring.profiles.active=$ENVIRONMENT /var/lib/studyloft_api/studyloft_api.jar