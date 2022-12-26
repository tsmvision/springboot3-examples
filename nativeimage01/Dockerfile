FROM ubuntu:22.04 as builder
WORKDIR /www
COPY pom.xml pom.xml
COPY src src
COPY docker-init.sh docker-init.sh
RUN chmod +x /www/docker-init.sh && /www/docker-init.sh

FROM alpine:3.17
WORKDIR /www
COPY --from=builder /www/target/nativeimage01 app
RUN apk update && apk add gcompat libstdc++

CMD ["/www/app"]