FROM openjdk:11-jre
ARG USER_ID="1000"
ARG GROUP_ID="1000"
ARG USER_NAME="spring"
RUN groupadd -g "${GROUP_ID}" "${USER_NAME}" && \
  useradd -l -u "${USER_ID}" -m "${USER_NAME}" -g "${USER_NAME}"
USER spring
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
EXPOSE 8080