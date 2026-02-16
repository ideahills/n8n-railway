FROM node:20-slim

ARG N8N_VERSION=2.7.4

USER root

RUN apt-get update && \
    apt-get install -y python3-full python3-pip graphicsmagick git && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /tmp/test_venv_check && rm -rf /tmp/test_venv_check

RUN npm install -g n8n@${N8N_VERSION}

ENV N8N_PYTHON_BINARY=/usr/bin/python3
ENV HOME=/home/node

CMD ["n8n", "start"]
