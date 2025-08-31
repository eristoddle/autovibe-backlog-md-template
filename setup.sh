#!/bin/bash
#
# setup.sh - Installs the required global tools for this template.

set -e

echo "🚀 Starting setup..."
echo "This will install 'backlog.md' and 'repomix' globally using npm,"
echo "and install Python packages from requirements.txt."
echo ""

# --- Check for prerequisites ---
if ! command -v npm &> /dev/null; then
    echo "❌ Error: npm is not installed. Please install Node.js first."
    exit 1
fi

if ! command -v pip3 &> /dev/null; then
    echo "❌ Error: pip3 is not installed. Please install Python 3 first."
    exit 1
fi

# --- Install Global NPM Packages ---
echo "📦 Installing global Node.js tools..."
echo "You may be asked for your password to install packages globally."

# Using 'sudo' is common for -g, but we check if it's needed first.
if command -v sudo &> /dev/null && ! npm config get prefix | grep -q "$HOME"; then
    sudo npm install -g backlog.md repomix
else
    npm install -g backlog.md repomix
fi

echo "✅ Node.js tools installed."
echo ""

# --- Install Python Packages ---
echo "🐍 Installing Python packages..."
pip3 install -r requirements.txt
echo "✅ Python packages installed."
echo ""

echo "🎉 Setup complete! The 'backlog' and 'repomix' commands are now available globally."