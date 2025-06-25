#!/bin/bash
set -e

echo "🚀 Setting up Quarto-Marimo development environment..."

export PATH="/home/linuxbrew/.linuxbrew/bin:/home/vscode/.cargo/bin:$PATH"

echo "🐍 Setting up Python environment..."
cd /workspace
uv venv
uv sync

echo "📚 Installing Quarto extensions..."
quarto add marimo-team/quarto-marimo --no-prompt

echo "✅ Development environment ready!"
echo ""
echo "Available commands:"
echo "  make preview  - Start Quarto preview server"
echo "  make edit     - Start Marimo editor"
echo "  make dev      - Run both preview and edit in parallel"
echo "  make tmux-dev - Run in tmux session"
echo ""
echo "Ports:"
echo "  2718 - Marimo editor"
echo "  7575 - Quarto preview"