# RDCL Scoreboard Setup Guide

This scoreboard is based on the CRG (Carolina Roller Girls) Scoreboard and includes full support for **RDCL (Roller Derby Coalition of Leagues)** ruleset.

## What's Included

The scoreboard already has comprehensive RDCL support built-in, including:

### RDCL Ruleset Features

**Game Structure:**
- **4 periods** of 15 minutes each (vs WFTDA's 2 periods of 30 minutes)
- **Jam duration:** 1 minute (vs WFTDA's 2 minutes)
- **Jam numbering:** Continuous across all periods (doesn't reset each period)
- **Period ending:** Can end mid-jam (not restricted to between jams)
- **Intermissions:** 5:00, 15:00, 5:00 between periods, plus 60:00 before overtime

**Penalty System:**
- Custom RDCL penalty codes defined in `/config/penalties/RDCL.json`
- Different penalty abbreviations and verbal cues compared to WFTDA

**Timeout Rules:**
- **RDCL Per Half Rules:** Special timeout allocation where:
  - One team timeout is restricted to the first two periods (first half)
  - One team timeout is restricted to periods 3-4 (second half)
  - Official reviews are similarly stretched across the halves

**Scoring:**
- WFTDA Late Score Change Rule is **disabled** for RDCL games

### RDCL Penalty Codes

The following penalty codes are defined for RDCL:

| Code | Verbal Cue |
|------|------------|
| ? | Unknown |
| AS | Above the Shoulders |
| A | Arms |
| B | Back Blocking |
| L | Low Blocking |
| S | Stopping |
| DB | Directional Blocking |
| MB | Multi-Player Blocking |
| BB | Blocking Out of Bounds |
| AB | Assisting Out of Bounds |
| FR | Failure to Reform |
| OP | Skating Out of Play |
| BP | Blocking Out of Play |
| AP | Assisting Out of Play |
| SB | Skating Out of Bounds |
| X | Cutting the Track |
| IB | Illegal Block |
| IP | Illegal Procedure |
| UC | Unsporting Conduct |
| IS | Insubordination / Fighting |

### RDCL Half Game Variant

For shorter games (half-game format), there's also an **RDCL Half Game** ruleset with:
- **2 periods** of 15 minutes each
- **Intermission:** 5:00, then 60:00 before overtime
- **Foul-out limit:** 4 penalties (vs 7 in full game)
- **1 timeout per period**

## Installation

### Requirements

1. **Java 8 or newer** (Java 21 recommended)
2. **Apache Ant** (for building from source)
3. **Modern web browser** (Chrome, Edge, or Chromium-based recommended)

### Building the Scoreboard

```bash
# Install dependencies (Ubuntu/Debian)
apt-get install -y ant openjdk-21-jdk

# Build the project
ant

# This will:
# - Compile all Java source code
# - Run unit tests
# - Package everything into lib/crg-scoreboard.jar
```

### Running the Scoreboard

**On Linux/Mac:**
```bash
./scoreboard.sh
```

**On Windows:**
```
scoreboard-Windows.exe
```

**Headless mode (for servers without display):**
```bash
java -Djava.awt.headless=true -jar lib/crg-scoreboard.jar
```

The scoreboard will start a web server on **port 8000**.

## Using RDCL Ruleset

### Setting up a New Game

1. Open your browser to `http://localhost:8000`
2. Click on **"Operator Control Panel"**
3. Enter your operator name and click Login
4. Click **"New Game"** or go to the Settings tab
5. In the **Ruleset** dropdown, select **"RDCL"** or **"RDCL half game"**
6. Configure team names, colors, and rosters as needed
7. Return to the Operator tab and start your game!

### During the Game

The scoreboard will automatically enforce RDCL rules:

- **Jam Timer:** Will count down from 1:00 (not 2:00)
- **Period Timer:** Will count down from 15:00 (not 30:00)
- **Periods:** You'll have 4 periods to work through
- **Penalties:** Use the RDCL penalty codes when tracking penalties
- **Timeouts:** The system automatically tracks which timeouts are available based on RDCL per-half rules

### Display Views

The scoreboard provides multiple views:

- **Main Scoreboard** - For audience/venue display
- **Operator Control Panel** - Main controls for scorekeepers
- **Overlay Views** - For video production (OBS, vMix, etc.)
- **NSO Sheets** - For penalty trackers, scorekeepers, etc.

## Key Differences from WFTDA

| Feature | WFTDA | RDCL |
|---------|-------|------|
| Periods | 2 × 30 min | 4 × 15 min |
| Jam Duration | 2:00 | 1:00 |
| Jam Numbering | Reset each period | Continuous |
| Period Ending | Between jams only | Can end anytime |
| Penalty Codes | WFTDA 2018+ codes | RDCL-specific codes |
| Timeout Rules | Standard per game/period | Per-half restrictions |
| Late Score Changes | Restricted in last 2min | Not restricted |
| Foul-out Limit | 7 penalties | 7 (4 in half game) |

## Customization

### Modifying RDCL Rules

If you need to customize the RDCL ruleset:

1. The main RDCL configuration is in:
   - `src/com/carolinarollergirls/scoreboard/core/prepared/RulesetsImpl.java` (lines 72-92)
2. RDCL penalty codes are in:
   - `config/penalties/RDCL.json`
3. After making changes, rebuild with `ant`

### Creating a Custom Ruleset

You can create your own custom rulesets through the web interface:

1. Go to Settings → Rulesets
2. Create a new ruleset based on RDCL
3. Modify individual rules as needed
4. Save and use for your games

## Troubleshooting

**Server won't start:**
- Check if port 8000 is already in use
- Ensure Java 8+ is installed: `java -version`
- Check file permissions (write access to scoreboard folder needed)

**RDCL ruleset not appearing:**
- Ensure you've built the latest version with `ant`
- Check that `config/penalties/RDCL.json` exists

**Wrong jam/period duration:**
- Verify you've selected the "RDCL" ruleset, not "WFTDA"
- Check Settings → Rules to confirm active ruleset

## Advanced Features

### Statsbook Export

The scoreboard can export game data to WFTDA-format statsbook files (.xlsx). Note that RDCL games will still export to this format, though some RDCL-specific features may not be fully represented.

### Video Overlays

The scoreboard includes several overlay views optimized for OBS/vMix:

- Go to `http://localhost:8000`
- Select overlay views (whiteboard, scoreboard, etc.)
- Add as browser source in your streaming software
- Use chroma key (green screen) if needed

### Network Setup

For multi-computer setups (operator + displays on different machines):

1. Start the scoreboard on one "host" computer
2. Note the IP address shown on startup
3. Connect other devices via: `http://[host-ip]:8000`
4. Each device can display different views

## Contributing

This scoreboard is open source! If you find issues or want to add features:

- GitHub: https://github.com/rollerderby/scoreboard
- Report bugs: https://github.com/rollerderby/scoreboard/issues

## License

This software is distributed under a dual-license model:
- Apache License 2.0
- GNU General Public License v2.0

See COPYING, COPYING-AL, and COPYING-GPL for details.

## Credits

- **CRG Scoreboard** - Original WFTDA-compliant scoreboard system
- **RDCL Support** - Built-in support for Roller Derby Coalition of Leagues rules
- **Community Contributors** - Thank you to everyone who has contributed!

---

**Version:** Build from commit e878d87
**Build Date:** 2025-10-30
