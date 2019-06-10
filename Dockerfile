FROM alpine:latest

RUN apk add --no-cache openssh

ENV REMOTE_URL tunnel.hellomybot.io
ENV REMOTE_URL_PORT 2222
ENV REMOTE_SUBDOMAIN foo
ENV REMOTE_SUBDOMAIN_PORT 80
ENV LOCAL_HOST localhost
ENV LOCAL_PORT 3000

ENV KEY_NAME keyTunnelHMB


VOLUME /root/.ssh

CMD ssh \
    -i ~/.ssh/$KEY_NAME \
    -o "StrictHostKeyChecking no" \
    -p $REMOTE_URL_PORT \
    -R $REMOTE_SUBDOMAIN:$REMOTE_SUBDOMAIN_PORT:$LOCAL_HOST:$LOCAL_PORT \
    $REMOTE_URL