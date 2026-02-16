FROM n8nio/n8n:2.7.4

USER root

CMD hostname -i && n8n start
