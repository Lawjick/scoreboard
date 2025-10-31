# 🛼 RDCL Scoreboard - START HERE!

## ✅ Your Scoreboard is DEPLOYED and RUNNING!

The RDCL scoreboard server is currently active on port 8000.

---

## 🚀 Quick Access

### Option 1: Open the Test Page (Recommended)

Open this file in your browser for a beautiful interface with all the links:

```
file:///home/user/scoreboard/TEST-PAGE.html
```

Or if on the same machine as the server:
```
http://localhost:8000/
```

### Option 2: Direct Links

| View | URL |
|------|-----|
| **🎮 Operator Panel** | http://localhost:8000/views/operator.html |
| **📺 Scoreboard Display** | http://localhost:8000/views/standard.html |
| **🎥 Video Overlay** | http://localhost:8000/views/overlay.html |
| **📋 Main Menu** | http://localhost:8000/ |

### Network Access (Other Devices)
```
http://21.0.0.58:8000
```

---

## 🎯 First Test - Create an RDCL Game

**5-Minute Test:**

1. **Open:** http://localhost:8000/views/operator.html
2. **Login:** Enter your name → Click "Login"
3. **New Game:** Click "New Game" button (top right)
4. **Select Ruleset:** Choose **"RDCL"** from dropdown
5. **Add Teams:**
   - Team 1: "Derby Destroyers" (or any name)
   - Team 2: "Roller Rebels" (or any name)
6. **Start Game:** Click "Start Game"

**Verify RDCL is working:**
- ✅ Period clock shows **15:00** (not 30:00)
- ✅ Game has **4 periods** (not 2)
- ✅ Jam timer shows **1:00** (not 2:00)
- ✅ Bottom of screen shows "RDCL" ruleset

---

## 📚 Documentation

| Guide | Purpose |
|-------|---------|
| **RDCL-QUICKSTART.md** | Get started in 5 minutes |
| **RDCL-SETUP.md** | Complete setup and features guide |
| **DEPLOYMENT.md** | Deployment, testing, and troubleshooting |
| **TEST-PAGE.html** | Visual test interface (open in browser) |

---

## ⚙️ Server Management

### Start Server
```bash
./start-scoreboard.sh
```

### Stop Server
```bash
./stop-scoreboard.sh
```

### Check Status
```bash
ps aux | grep crg-scoreboard
```

### View Logs
```bash
tail -f scoreboard.log
```

---

## 🎮 Test Scenarios

### Test 1: Basic RDCL Game (5 minutes)
- Create new game with RDCL ruleset
- Verify period and jam durations
- Start and stop jams
- Add scores to teams
- Verify display updates

### Test 2: Penalty Tracking (5 minutes)
- Add skaters to teams
- Start a jam
- Assign penalties using RDCL codes:
  - **X** - Cutting the Track
  - **B** - Back Blocking
  - **L** - Low Blocking
- Verify penalties appear on display

### Test 3: Multi-View (5 minutes)
- Open Operator Panel in one window
- Open Scoreboard Display in another
- Press F11 on scoreboard for fullscreen
- Control game from operator panel
- Watch updates on scoreboard display

### Test 4: RDCL Timeout Rules (5 minutes)
- Create RDCL game
- Request team timeout in period 1
- Try to request another in period 2
- Verify per-half restrictions work

---

## 🔥 Quick Troubleshooting

| Problem | Solution |
|---------|----------|
| Can't connect to http://localhost:8000 | Run `./start-scoreboard.sh` |
| Server already running error | Run `./stop-scoreboard.sh` first |
| Wrong jam duration (showing 2:00) | Select "RDCL" ruleset, not "WFTDA" |
| Need to reset | Stop server, delete autosave, restart |

---

## 🌐 Multi-Device Setup

**Operator Computer:**
```
http://localhost:8000/views/operator.html
```

**Scoreboard Display (Projector):**
```
http://21.0.0.58:8000/views/standard.html
```

**NSO Tablets/Laptops:**
```
http://21.0.0.58:8000/nso/sk.html     (Score Keeper)
http://21.0.0.58:8000/nso/plt.html    (Penalty Tracker)
```

**Streaming/OBS:**
```
http://21.0.0.58:8000/views/overlay.html
```

---

## 💡 What Makes This RDCL?

| Feature | WFTDA | RDCL |
|---------|-------|------|
| Periods | 2 × 30min | **4 × 15min** |
| Jam Length | 2:00 | **1:00** |
| Jam Numbers | Reset each period | **Continuous** |
| Intermissions | 1 × 15min | **5min, 15min, 5min** |
| Penalty Codes | WFTDA 2018+ | **RDCL codes** |
| Timeout Rules | Standard | **Per-half rules** |

---

## 🎉 You're Ready!

Your RDCL scoreboard is fully functional and ready for:
- ✅ Practice bouts
- ✅ Scrimmages
- ✅ Official games
- ✅ Live streaming
- ✅ Multi-venue setups

**Open the test page and start testing:**
```
file:///home/user/scoreboard/TEST-PAGE.html
```

Or dive right in:
```
http://localhost:8000/views/operator.html
```

---

**Let's roll! 🛼**

*Built with CRG Scoreboard | RDCL Ready ✓*
