FROM mcr.microsoft.com/devcontainers/python:3.11-bullseye

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
    && echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /etc/profile.d/brew.sh \
    && chmod +x /etc/profile.d/brew.sh

ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"

RUN brew install quarto

RUN curl -LsSf https://astral.sh/uv/install.sh | sh

ENV PATH="/root/.cargo/bin:${PATH}"

USER vscode

RUN curl -LsSf https://astral.sh/uv/install.sh | sh

ENV PATH="/home/vscode/.cargo/bin:${PATH}"
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"

WORKDIR /workspace

CMD ["sleep", "infinity"]