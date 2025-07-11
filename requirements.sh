#!/bin/bash

set -e  # Exit on error
set -u  # Treat unset variables as error

echo "📦 Updating package lists..."
sudo apt update

echo "⬇️ Installing system packages..."
sudo apt install -y \
    git \
    curl \
    make \
    gcc \
    g++ \
    ripgrep \
    fd-find \
    fzf \
    clang \
    clang-tidy \
    clang-format \
    nodejs \
    npm \
    python3 \
    python3-pip

echo "Compiling fzf native"
cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim
make

echo "📦 Installing Node.js packages..."
npm install -g neovim

echo "🦀 Installing Cargo packages (Rust)..."
if ! command -v cargo >/dev/null 2>&1; then
    echo "🔨 Rust not found. Installing Rust..."
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    source $HOME/.cargo/env
fi
cargo install stylua

echo "✅ All dependencies installed successfully!"
