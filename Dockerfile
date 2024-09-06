FROM eclipse-temurin:21-jre-alpine
LABEL maintainer="ismoon <ismoon@gmail.com>"
COPY ./target/05_Department-0.0.1-SNAPSHOT.jar /root
ARG PROFILE=dev
ARG PORT=8088
ENV TZ=Asia/Seoul
ENV PROFILE=${PROFILE}
EXPOSE ${PORT}
WORKDIR /root
CMD ["java", "-jar", "05_Department-0.0.1-SNAPSHOT.jar", "--spring.profiles.active=${PROFILE}"]
