FROM easypi/alpine-arm

RUN set -xe && \
        apk update && apk add --no-cache py-pip && pip install shadowsocks

ENV SERVER_ADDR=
ENV SERVER_PORT 8388
ENV METHOD      aes-256-cfb
ENV PASSWORD=
ENV LOCAL_ADDR  0.0.0.0
ENV LOCAL_PORT  1080
ENV TIMEOUT     60

EXPOSE $LOCAL_PORT

CMD ss-local -s "$SERVER_ADDR" \
    -p "$SERVER_PORT" \
    -m "$METHOD"      \
    -k "$PASSWORD"    \
    -b "$LOCAL_ADDR"  \
    -l "$LOCAL_PORT"  \
    -t "$TIMEOUT"     \
    -A                \
    --fast-open $OPTIONS