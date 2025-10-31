#!/bin/bash
# Stop the RDCL Scoreboard

echo "=========================================="
echo "  Stopping RDCL Scoreboard..."
echo "=========================================="

# Find and kill the process
PIDS=$(ps aux | grep -v grep | grep "crg-scoreboard.jar" | awk '{print $2}')

if [ -z "$PIDS" ]; then
    echo "ℹ️  No scoreboard process found (already stopped)"
    exit 0
fi

for PID in $PIDS; do
    echo "Stopping process $PID..."
    kill $PID

    # Wait for graceful shutdown
    sleep 2

    # Force kill if still running
    if ps -p $PID > /dev/null 2>&1; then
        echo "Force stopping process $PID..."
        kill -9 $PID
    fi
done

echo ""
echo "✅ Scoreboard stopped successfully!"
echo ""
