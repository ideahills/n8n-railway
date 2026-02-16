FROM node:20-alpine

ARG N8N_VERSION=2.7.4

# 1. Install System Dependencies (Keep these!)
# We add python3 and py3-pip here so they stay in the final image
RUN apk add --update graphicsmagick tzdata python3 py3-pip

USER root

# 2. Install Build Dependencies (Delete these later)
# We only put 'build-base' here, NOT python3
RUN apk --update add --virtual build-dependencies build-base && \
    npm_config_user=root npm install --location=global n8n@${N8N_VERSION} && \
    apk del build-dependencies

WORKDIR /data

EXPOSE $PORT

ENV N8N_USER_ID=root

# 3. Explicitly tell n8n where Python is (Optional but recommended)
ENV N8N_PYTHON_BINARY=/usr/bin/python3

CMD export N8N_PORT=$PORT && n8n start
