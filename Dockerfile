FROM n8nio/n8n:2.7.4

USER root

RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    rm -rf /var/lib/apt/lists/*

USER node
