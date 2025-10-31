#!/bin/bash
# RDCL Scoreboard - Web Access Setup
# Run this script to make your scoreboard accessible from the web

echo "=========================================="
echo "  RDCL Scoreboard - Web Access Setup"
echo "=========================================="
echo ""

cd /home/user/scoreboard

# Check if scoreboard is running
if ! ps aux | grep -v grep | grep "crg-scoreboard.jar" > /dev/null; then
    echo "⚠️  Scoreboard is not running!"
    echo ""
    echo "Please start it first:"
    echo "  ./start-scoreboard.sh"
    echo ""
    exit 1
fi

echo "✅ Scoreboard is running on port 8000"
echo ""

# Check if ngrok already exists
if [ -f "./ngrok" ]; then
    echo "✅ Ngrok already downloaded"
else
    echo "📥 Downloading ngrok..."
    if wget -q https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz; then
        echo "📦 Extracting..."
        tar xzf ngrok-v3-stable-linux-amd64.tgz
        chmod +x ngrok
        rm ngrok-v3-stable-linux-amd64.tgz
        echo "✅ Ngrok installed successfully!"
    else
        echo "❌ Failed to download ngrok"
        echo ""
        echo "Alternative: Try Cloudflare Tunnel"
        echo "  wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64"
        echo "  chmod +x cloudflared-linux-amd64"
        echo "  ./cloudflared-linux-amd64 tunnel --url http://localhost:8000"
        exit 1
    fi
fi

echo ""
echo "=========================================="
echo "  Starting Ngrok Tunnel..."
echo "=========================================="
echo ""
echo "This will create a public URL for your scoreboard."
echo "Press Ctrl+C to stop the tunnel when done."
echo ""
echo "Starting in 3 seconds..."
sleep 3

# Start ngrok
./ngrok http 8000
