FROM n8nio/n8n:2.7.4

USER root

RUN apk add --update --no-cache python3 py3-pip

RUN rm -rf /var/cache/apk/*

USER node
