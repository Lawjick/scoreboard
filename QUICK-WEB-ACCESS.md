# 🌐 Quick Web Access - RDCL Scoreboard

## You Need a Public URL to Access From the Web

Your scoreboard is running locally on port 8000, but it's not accessible from the internet yet.

---

## 🚀 Fastest Solution: Run This One Command

```bash
cd /home/user/scoreboard
./setup-web-access.sh
```

This will:
1. ✅ Download ngrok (tunnel service)
2. ✅ Start a tunnel to your scoreboard
3. ✅ Give you a public URL like: `https://xxxx.ngrok-free.app`

**Then share that URL with anyone!**

---

## 📱 What You'll Get

After running the script, you'll see output like:

```
Forwarding    https://a1b2-c3d4-e5f6.ngrok-free.app -> http://localhost:8000
```

**Copy that URL!** Now anyone can access:

- **Operator Panel:**
  `https://a1b2-c3d4-e5f6.ngrok-free.app/views/operator.html`

- **Scoreboard Display:**
  `https://a1b2-c3d4-e5f6.ngrok-free.app/views/standard.html`

- **Video Overlay:**
  `https://a1b2-c3d4-e5f6.ngrok-free.app/views/overlay.html`

---

## 📋 Step-by-Step

### Step 1: Make Sure Scoreboard is Running
```bash
./start-scoreboard.sh
```

### Step 2: Setup Web Access
```bash
./setup-web-access.sh
```

### Step 3: Copy Your Public URL
Look for the "Forwarding" line in the output.

### Step 4: Test It!
Open that URL in your browser from ANY device - phone, tablet, anywhere!

---

## ⚡ Alternative: Manual Ngrok Setup

If the script doesn't work:

```bash
# Download ngrok manually
cd /home/user/scoreboard
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar xzf ngrok-v3-stable-linux-amd64.tgz

# Start tunnel
./ngrok http 8000
```

---

## 🔒 Add Password Protection (Optional)

To require a password for access:

```bash
./ngrok http 8000 --basic-auth="username:password"
```

Replace `username` and `password` with your own.

---

## 💡 Tips

- **Free tier limits:** Ngrok free has connection limits
- **URL changes:** Free URLs change each time you restart ngrok
- **Keep it running:** Don't close the ngrok terminal
- **Stop tunnel:** Press Ctrl+C in the ngrok terminal

---

## 🆘 Troubleshooting

### Script fails to download ngrok

Try **Cloudflare Tunnel** instead:

```bash
wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
chmod +x cloudflared-linux-amd64
./cloudflared-linux-amd64 tunnel --url http://localhost:8000
```

### Ngrok shows error 108

Free tier connection limit reached. Wait a bit or upgrade.

### Tunnel disconnects

Run ngrok in a screen session:

```bash
screen -S ngrok
./ngrok http 8000
# Press Ctrl+A then D to detach
```

Reattach later with:
```bash
screen -r ngrok
```

---

## 🎯 Quick Summary

**To access your scoreboard from the web:**

1. Scoreboard must be running: `./start-scoreboard.sh`
2. Create tunnel: `./setup-web-access.sh`
3. Copy the ngrok URL from the output
4. Share and access from anywhere!

**That's it!** 🎉

---

**Need more options?** See `WEB-ACCESS.md` for alternative methods.
