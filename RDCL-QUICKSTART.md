# RDCL Scoreboard - Quick Start Guide

Get up and running with RDCL roller derby scoreboard in 5 minutes!

## Quick Setup

### 1. Install & Build (First time only)

```bash
# Install Java and Ant (if not already installed)
apt-get install -y ant openjdk-21-jdk

# Build the scoreboard
ant
```

### 2. Start the Scoreboard

```bash
# On Linux/Mac
./scoreboard.sh

# On Windows
scoreboard-Windows.exe
```

The server will start on **http://localhost:8000**

### 3. Open in Browser

1. Open `start.html` in Chrome/Edge, **OR**
2. Navigate to `http://localhost:8000`

### 4. Setup Your Game

1. Click **"Operator Control Panel"**
2. Enter your name → Login
3. Click **"New Game"**
4. Select ruleset: **"RDCL"** (or "RDCL half game")
5. Add team names and rosters
6. You're ready to roll!

## RDCL Rules at a Glance

| Setting | Value |
|---------|-------|
| **Periods** | 4 × 15 minutes |
| **Jams** | 1:00 max |
| **Intermissions** | 5:00, 15:00, 5:00 |
| **Team Timeouts** | 3 (per-half restrictions) |
| **Official Reviews** | 1 per period (per-half rules) |
| **Foul-out** | 7 penalties |

### RDCL Half Game (Shorter Format)

| Setting | Value |
|---------|-------|
| **Periods** | 2 × 15 minutes |
| **Intermission** | 5:00 |
| **Timeouts** | 1 per period |
| **Foul-out** | 4 penalties |

## Common Tasks

### Display the Scoreboard

1. Right-click **"Main Scoreboard"** → Open in new window
2. Drag to projector/second monitor
3. Press **F11** for fullscreen

### Add Penalty Codes

Use these RDCL penalty codes during the game:

**Most Common:**
- **X** - Cutting the Track
- **B** - Back Blocking
- **L** - Low Blocking
- **MB** - Multi-Player Blocking
- **IP** - Illegal Procedure
- **UC** - Unsporting Conduct

[See full list in RDCL-SETUP.md]

### Video Overlay

For streaming/recording:

1. Go to `http://localhost:8000`
2. Choose overlay view (scoreboard overlay, whiteboard, etc.)
3. Add as browser source in OBS/vMix
4. Set resolution to 1920×1080

## Troubleshooting

| Problem | Solution |
|---------|----------|
| Server won't start | Check Java installed: `java -version` |
| Can't connect | Check firewall, use correct IP address |
| RDCL not in ruleset list | Rebuild with `ant` |
| Wrong jam duration | Verify RDCL ruleset selected in Settings |

## Key URLs

- **Main Index:** http://localhost:8000
- **Operator Panel:** http://localhost:8000/views/operator.html
- **Scoreboard Display:** http://localhost:8000/views/standard.html
- **Overlays:** http://localhost:8000/views/overlay.html

## Need Help?

- **Full Setup Guide:** See `RDCL-SETUP.md`
- **Report Issues:** https://github.com/rollerderby/scoreboard/issues
- **Wiki:** https://github.com/rollerderby/scoreboard/wiki

---

**Built with CRG Scoreboard** | **RDCL Ready** ✓
