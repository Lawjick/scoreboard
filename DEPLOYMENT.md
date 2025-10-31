# RDCL Scoreboard - Deployment Guide

## 🎉 Your Scoreboard is LIVE!

The RDCL scoreboard is currently running and ready to test!

## Access URLs

### Local Access (Same Machine)
```
http://localhost:8000
```

### Network Access (Other Devices)
```
http://21.0.0.58:8000
```

## Quick Access Links

| View | URL | Purpose |
|------|-----|---------|
| **Main Menu** | http://localhost:8000/ | Start here - links to all views |
| **Operator Panel** | http://localhost:8000/views/operator.html | Main control panel for running games |
| **Scoreboard Display** | http://localhost:8000/views/standard.html | Audience/venue display |
| **Overlay (Video)** | http://localhost:8000/views/overlay.html | For OBS/vMix streaming |
| **Whiteboard Overlay** | http://localhost:8000/views/whiteboard.html | Whiteboard-style overlay |
| **Scoreboard Keeper** | http://localhost:8000/nso/sk.html | Score tracking sheet |
| **Penalty Tracker** | http://localhost:8000/nso/plt.html | Penalty lineup tracking |

## Testing the RDCL Ruleset

### Step 1: Open Operator Panel

1. Navigate to: http://localhost:8000/views/operator.html
2. Enter your name as operator
3. Click "Login"

### Step 2: Create New Game

1. Click **"New Game"** button (top right)
2. In the Settings section, find **"Ruleset"**
3. Select **"RDCL"** from dropdown
   - For shorter games, select **"RDCL half game"**

### Step 3: Configure Teams

1. **Team 1 (Left side):**
   - Name: e.g., "Derby Destroyers"
   - Color: Choose team color
   - Add skaters (optional for testing)

2. **Team 2 (Right side):**
   - Name: e.g., "Roller Rebels"
   - Color: Choose team color
   - Add skaters (optional for testing)

### Step 4: Verify RDCL Settings

Check that the game shows:
- ✅ **4 Periods** (not 2)
- ✅ **Period Duration: 15:00** (not 30:00)
- ✅ **Jam Duration: 1:00** (not 2:00)
- ✅ **Timeouts: 3 per team** (with per-half rules)

### Step 5: Start the Game

1. Click **"Start Game"** or use the game controls
2. The period clock should show **15:00**
3. Start a jam - it should count down from **1:00**

## Testing Scenarios

### Test 1: Basic Jam
- Start a jam
- Verify jam timer counts down from 1:00
- Call off the jam early
- Confirm lineup timer starts

### Test 2: Scoring
- Start a jam
- Assign lead jammer
- Add points to a team
- Verify score updates on display

### Test 3: Penalties (RDCL Codes)
- Start a jam
- Select a skater
- Add a penalty using RDCL codes:
  - **X** - Cutting
  - **B** - Back Blocking
  - **L** - Low Blocking
  - **MB** - Multi-Player
- Verify penalty appears

### Test 4: Periods
- Complete period 1 (let clock run or force end)
- Start intermission (should be 5:00)
- Start period 2
- Verify jam numbers continue (not reset)
- Continue through all 4 periods

### Test 5: RDCL Timeout Rules
- Request a team timeout in period 1 or 2
- Verify it's marked as "first half" timeout
- Try to request another timeout in the same half
- Should only allow one per half

## Display Testing

### Multi-Screen Setup

**Screen 1 (Operator):**
```
http://localhost:8000/views/operator.html
```

**Screen 2 (Audience/Venue):**
```
http://localhost:8000/views/standard.html
```
Press F11 for fullscreen

**Screen 3 (NSO - Scorekeeping):**
```
http://localhost:8000/nso/sk.html
```

### Video Overlay Testing (OBS/vMix)

1. Add Browser Source in OBS/vMix
2. URL: `http://localhost:8000/views/overlay.html`
3. Resolution: 1920x1080
4. Set chroma key if using green screen
5. Verify scoreboard displays over video

## Server Management

### Start Server
```bash
./start-scoreboard.sh
```

### Stop Server
```bash
./stop-scoreboard.sh
```

### Check Server Status
```bash
ps aux | grep crg-scoreboard.jar
```

### View Logs
```bash
tail -f scoreboard.log
```

### Restart Server
```bash
./stop-scoreboard.sh && ./start-scoreboard.sh
```

## Network/Remote Access

To access from other devices on your network:

1. **Find server IP:**
   ```bash
   hostname -I
   ```

2. **On remote device, navigate to:**
   ```
   http://[SERVER-IP]:8000
   ```
   Example: `http://21.0.0.58:8000`

3. **Firewall Settings:**
   If you can't connect, allow port 8000:
   ```bash
   # Ubuntu/Debian
   sudo ufw allow 8000/tcp

   # Or using iptables
   sudo iptables -A INPUT -p tcp --dport 8000 -j ACCEPT
   ```

## Troubleshooting

### Server Won't Start

**Check if already running:**
```bash
ps aux | grep crg-scoreboard
./stop-scoreboard.sh
./start-scoreboard.sh
```

**Check port 8000 is available:**
```bash
netstat -tulpn | grep :8000
# or
ss -tulpn | grep :8000
```

**Check Java version:**
```bash
java -version
# Should be 8 or higher
```

### Can't Access from Browser

1. Try different URL formats:
   - `http://localhost:8000`
   - `http://127.0.0.1:8000`
   - `http://[your-ip]:8000`

2. Check browser console for errors (F12)

3. Verify server is running:
   ```bash
   curl http://localhost:8000
   ```

### RDCL Ruleset Not Available

1. Rebuild the project:
   ```bash
   ./stop-scoreboard.sh
   ant clean
   ant
   ./start-scoreboard.sh
   ```

2. Check that RDCL.json exists:
   ```bash
   ls -la config/penalties/RDCL.json
   ```

### Wrong Jam/Period Duration

- Verify you selected "RDCL" ruleset (not "WFTDA")
- Go to Settings → Rules to verify current settings
- Create a new game with correct ruleset

## Production Deployment

### Running as a Service (Linux)

Create systemd service file: `/etc/systemd/system/rdcl-scoreboard.service`

```ini
[Unit]
Description=RDCL Roller Derby Scoreboard
After=network.target

[Service]
Type=simple
User=yourusername
WorkingDirectory=/path/to/scoreboard
ExecStart=/usr/bin/java -Djava.awt.headless=true -jar lib/crg-scoreboard.jar
Restart=on-failure
RestartSec=10

[Install]
WantedBy=multi-user.target
```

Enable and start:
```bash
sudo systemctl enable rdcl-scoreboard
sudo systemctl start rdcl-scoreboard
sudo systemctl status rdcl-scoreboard
```

### Running on Boot (Simple)

Add to crontab:
```bash
crontab -e
```

Add line:
```
@reboot cd /path/to/scoreboard && ./start-scoreboard.sh
```

## Performance Tips

- **Dedicated Machine:** Use a dedicated computer for scoreboard during games
- **Close Other Apps:** Minimize browser tabs and applications
- **Wired Network:** Use ethernet instead of WiFi for reliability
- **Hardware:** 4GB+ RAM, dual-core processor recommended
- **Browser:** Chrome/Chromium for best performance

## Backup and Recovery

### Save Game State

The scoreboard auto-saves to:
```
config/autosave/scoreboard-0-secs-ago.json
```

### Manual Backup

```bash
cp config/autosave/scoreboard-0-secs-ago.json backups/game-$(date +%Y%m%d-%H%M%S).json
```

### Restore Game

1. Stop server
2. Copy backup to autosave folder
3. Restart server

## Support

- **Documentation:** See `RDCL-SETUP.md` and `RDCL-QUICKSTART.md`
- **Logs:** Check `scoreboard.log` for errors
- **GitHub Issues:** https://github.com/rollerderby/scoreboard/issues
- **Wiki:** https://github.com/rollerderby/scoreboard/wiki

---

## Current Status

✅ **Server Status:** RUNNING
✅ **Port:** 8000
✅ **RDCL Ruleset:** ACTIVE
✅ **Build:** e878d87-20251030145943

**Ready to test!** 🛼
