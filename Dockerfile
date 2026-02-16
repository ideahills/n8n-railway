# 1. Use Debian (Slim) instead of Alpine
# This fixes the missing 'venv' and 'ensurepip' modules
FROM node:20-slim

ARG N8N_VERSION=2.7.4

# 2. Install System Dependencies
# 'python3-venv' is a separate package in Debian, we MUST install it explicitly
RUN apt-get update && \
    apt-get install -y python3 python3-venv python3-pip graphicsmagick && \
    rm -rf /var/lib/apt/lists/*

USER root

# 3. Install n8n
RUN npm install -g n8n@${N8N_VERSION}

WORKDIR /data

# 4. Explicitly tell n8n where python is
ENV N8N_PYTHON_BINARY=/usr/bin/python3

# 5. Start n8n
CMD ["n8n", "start"]
