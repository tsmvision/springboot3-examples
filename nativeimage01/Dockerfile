FROM ubuntu:22.04 as builder
WORKDIR /www
COPY pom.xml .
COPY src src
ENV SDK_HOME /root/.sdkman
ENV GRAALVM_HOME $SDK_HOME/candidates/java/current
ENV SDK_INIT_FILE $SDK_HOME/bin/sdkman-init.sh

RUN apt update  \
    && apt upgrade \
    && apt install maven curl tar zip unzip build-essential libz-dev zlib1g-dev -y \
    && curl -s "https://get.sdkman.io" | bash \
    && bash -c "source $SDK_INIT_FILE && sdk install java 22.3.r17-grl && mvn -Pnative clean compile package native:compile"

FROM alpine:3.17
WORKDIR /www
COPY --from=builder /www/target/nativeimage01 app
RUN apk add gcompat

ENTRYPOINT ["./app"]