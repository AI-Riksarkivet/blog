.PHONY: install install-vscode install-quarto install-uv dev preview edit clean tmux-dev

FILE ?= index.qmd

install: install-uv install-vscode install-quarto
	@echo "✅ Installation complete!"

install-uv:
	@echo "🐍 Setting up Python environment with uv..."
	uv venv
	uv sync

install-vscode:
	@echo "🔧 Installing VS Code extensions..."
	code --install-extension marimo-team.vscode-marimo
	code --install-extension quarto.quarto

install-quarto:
	brew install quarto
	@echo "📚 Installing Quarto extensions..."
	quarto add marimo-team/quarto-marimo

preview:
	uvx --with marimo --from quarto-cli quarto preview

edit:
	@echo "📝 Editing $(FILE)..."
	uv run marimo edit $(FILE)

dev:
	$(MAKE) -j2 preview edit FILE=$(FILE)

# Arrow keys (most intuitive)
# Ctrl+b + ←  # Move to left pane
# Ctrl+b + →  # Move to right pane  
tmux-dev:
	@echo "🚀 Starting tmux session for $(FILE)..."
	tmux new-session -d -s marimo-dev
	tmux send-keys -t marimo-dev:0 'make preview' Enter
	tmux split-window -h -t marimo-dev:0
	tmux send-keys -t marimo-dev:0.1 'make edit FILE=$(FILE)' Enter
	tmux attach-session -t marimo-dev
