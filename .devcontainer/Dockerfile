FROM mcr.microsoft.com/devcontainers/python:3.10-bookworm-slim

RUN apt-get update && apt-get install -y \
    curl \
    git \
    gdebi-core \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb \
    && gdebi --non-interactive quarto-linux-amd64.deb \
    && rm quarto-linux-amd64.deb

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

USER vscode
