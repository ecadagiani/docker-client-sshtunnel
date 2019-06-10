FROM alpine:latest
LABEL maintainer="e.cadagiani@gmail.com"

RUN apk add --no-cache openssh

ENV CONNECTION_PORT 2222
ENV REMOTE domain.com
ENV REMOTE_SUBDOMAIN foo
ENV REMOTE_PORT 80
ENV LOCAL_HOST localhost
ENV LOCAL_PORT 3000

ENV KEY_NAME key_rsa


VOLUME /root/.ssh

CMD ssh \
    -i ~/.ssh/$KEY_NAME \
    -o "StrictHostKeyChecking no" \
    -p $CONNECTION_PORT \
    -R $REMOTE_SUBDOMAIN:$REMOTE_PORT:$LOCAL_HOST:$LOCAL_PORT \
    $REMOTE