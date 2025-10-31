#!/bin/bash
# RDCL Scoreboard Startup Script

cd "$(dirname "$0")"

echo "=========================================="
echo "  RDCL Scoreboard Starting..."
echo "=========================================="

# Check if already running
if ps aux | grep -v grep | grep "crg-scoreboard.jar" > /dev/null; then
    echo "⚠️  Scoreboard is already running!"
    echo ""
    echo "To stop it first, run:"
    echo "  ./stop-scoreboard.sh"
    echo ""
    ps aux | grep -v grep | grep "crg-scoreboard.jar" | awk '{print "Process ID: "$2}'
    exit 1
fi

# Check if JAR exists
if [ ! -f "lib/crg-scoreboard.jar" ]; then
    echo "❌ Error: lib/crg-scoreboard.jar not found!"
    echo ""
    echo "Please build the project first:"
    echo "  ant"
    exit 1
fi

# Start the server
echo "Starting scoreboard server..."
java -Djava.awt.headless=true -jar lib/crg-scoreboard.jar > scoreboard.log 2>&1 &
SCOREBOARD_PID=$!

# Wait for startup
echo "Waiting for server to start..."
sleep 3

# Check if it's running
if ps -p $SCOREBOARD_PID > /dev/null; then
    echo ""
    echo "✅ Scoreboard started successfully!"
    echo "   Process ID: $SCOREBOARD_PID"
    echo ""
    echo "=========================================="
    echo "  Access the scoreboard at:"
    echo "=========================================="
    echo ""
    echo "  Local:    http://localhost:8000"

    # Get IP addresses
    IPS=$(hostname -I 2>/dev/null || ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}' | tr '\n' ' ')
    if [ ! -z "$IPS" ]; then
        echo "  Network:  http://$(echo $IPS | awk '{print $1}'):8000"
    fi

    echo ""
    echo "=========================================="
    echo "  Quick Links:"
    echo "=========================================="
    echo ""
    echo "  Main Menu:         http://localhost:8000/"
    echo "  Operator Panel:    http://localhost:8000/views/operator.html"
    echo "  Scoreboard View:   http://localhost:8000/views/standard.html"
    echo "  Overlay (Video):   http://localhost:8000/views/overlay.html"
    echo ""
    echo "=========================================="
    echo "  RDCL Setup:"
    echo "=========================================="
    echo ""
    echo "  1. Open Operator Panel (link above)"
    echo "  2. Click 'New Game'"
    echo "  3. Select Ruleset: 'RDCL' or 'RDCL half game'"
    echo "  4. Configure teams and start!"
    echo ""
    echo "📝 Logs: tail -f scoreboard.log"
    echo "🛑 Stop:  ./stop-scoreboard.sh"
    echo ""
else
    echo ""
    echo "❌ Failed to start scoreboard!"
    echo ""
    echo "Check the log for errors:"
    echo "  tail -50 scoreboard.log"
    exit 1
fi
