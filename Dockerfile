FROM alpine:latest  

RUN addgroup -S appgroup && adduser -S appuser -G appgroup  

RUN apk add --no-cache --no-progress \
    inotify-tools \
    util-linux \
    file  

USER appuser  

WORKDIR /app  

CMD ["sh"]

