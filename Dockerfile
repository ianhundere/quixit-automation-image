FROM alpine/curl:8.12.1

LABEL maintainer="quixit"
LABEL description="File watcher container for quixit system"
LABEL version="1.0"

RUN apk add --no-cache --no-progress \
    inotify-tools \
    util-linux \
    file && \
    addgroup -S quixit && \
    adduser -S quixit -G quixit && \
    mkdir -p /scripts /tmp/markers && \
    chown -R quixit:quixit /scripts /tmp/markers

ENV TZ=UTC

WORKDIR /scripts

USER quixit

ENTRYPOINT ["/bin/sh", "-c"]
# if using image / remove this from args in deployment
CMD ["cp /scripts/wrapper.sh /tmp/wrapper.sh && chmod +x /tmp/wrapper.sh && exec /tmp/wrapper.sh"]
