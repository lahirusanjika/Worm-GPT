#!/bin/bash

# HacxGPT Installer for Linux and Termux
# https://github.com/lahirusanjika/Worm-GPT

echo "======================================"
echo "    WormGPT Installer Script"
echo "======================================"

# Function to detect package manager
detect_pkg_manager() {
    if command -v apt-get &> /dev/null; then
        echo "apt"
    elif command -v pkg &> /dev/null; then
        echo "pkg"
    else
        echo "unknown"
    fi
}

PKG_MANAGER=$(detect_pkg_manager)

# Update and install dependencies
echo "[+] Updating package lists..."
if [ "$PKG_MANAGER" = "apt" ]; then
    sudo apt-get update -y
    echo "[+] Installing git, python, and pip..."
    sudo apt-get install git python3 python3-pip -y
elif [ "$PKG_MANAGER" = "pkg" ]; then
    pkg update -y
    echo "[+] Installing git and python..."
    pkg install git python -y
else
    echo "[!] Unsupported package manager. Please install git, python3, and pip manually."
    exit 1
fi

# Clone the repository
if [ -d "Worm-GPT" ]; then
    echo "[!] Worm-GPT directory already exists. Skipping clone."
else
    echo "[+] Cloning Worm-GPT repository..."
    git clone https://github.com/lahirusanjika/Worm-GPT
fi

cd Worm-GPT

# Install Python requirements
echo "[+] Installing required python packages..."
if command -v pip3 &> /dev/null; then
    pip3 install -r requirements.txt
else
    pip install -r requirements.txt
fi

echo ""
echo "======================================"
echo "      Installation Complete!"
echo "======================================"
echo "To run WormGPT:"
echo "1. cd Worm-GPT"
echo "2. python3 HacxGPT.py"
echo ""
echo "Don't forget to get your API key from OpenRouter or DeepSeek!"
echo "======================================"
