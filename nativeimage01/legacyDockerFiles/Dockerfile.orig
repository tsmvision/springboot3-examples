FROM ghcr.io/graalvm/graalvm-ce:ol9-java17-22.3.0 as builder
WORKDIR /www
COPY pom.xml pom.xml
COPY src src
COPY docker-init.sh docker-init.sh
ARG MAVEN_FILE=apache-maven-3.8.6-bin.tar.gz
ARG MAVEN_DOWNLOAD_URL=https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/${MAVEN_FILE}
RUN chmod +x /www/docker-init.sh && /www/docker-init.sh

FROM alpine:3.17
WORKDIR /www
COPY --from=builder /www/target/nativeimage01 app
RUN apk update && apk add gcompat libstdc++

CMD ["/www/app"]