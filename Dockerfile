FROM node:20-slim

ARG N8N_VERSION=2.7.4

RUN apt-get update && \
    apt-get install -y python3 python3-venv python3-pip graphicsmagick git && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g n8n@${N8N_VERSION}

ENV HOME=/home/node
ENV N8N_PYTHON_BINARY=/usr/bin/python3

USER root

CMD ["n8n", "start"]
