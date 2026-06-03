FROM ghcr.io/nesquena/hermes-webui:latest

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/NousResearch/hermes-agent.git /opt/hermes-agent

WORKDIR /opt/hermes-agent
RUN /app/venv/bin/pip install --no-cache-dir -e .

WORKDIR /app
ENV HERMES_WEBUI_AGENT_DIR=/opt/hermes-agent

USER hermeswebui