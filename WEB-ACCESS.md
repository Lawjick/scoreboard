# 🌐 Web Access Guide for RDCL Scoreboard

## Current Status

Your scoreboard server is running on:
- **Local IP:** 21.0.0.102
- **Port:** 8000
- **Local Access:** http://localhost:8000

## Options to Access from the Web

### Option 1: Use Ngrok (Easiest - 2 minutes)

**On your server machine:**

1. **Download ngrok:**
   ```bash
   cd ~
   wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
   tar xzf ngrok-v3-stable-linux-amd64.tgz
   ```

2. **Start tunnel:**
   ```bash
   ./ngrok http 8000
   ```

3. **Get your public URL:**
   Look for the "Forwarding" line, it will show something like:
   ```
   Forwarding    https://xxxx-xx-xx-xx-xx.ngrok-free.app -> http://localhost:8000
   ```

4. **Share that URL!** Anyone can access your scoreboard at that ngrok URL.

**Pros:**
- ✅ Works instantly
- ✅ Free tier available
- ✅ HTTPS included
- ✅ No router config needed

**Cons:**
- ❌ URL changes each restart (upgrade to static)
- ❌ Free tier has connection limits

---

### Option 2: Cloudflare Tunnel (Free, Permanent)

**On your server machine:**

1. **Install cloudflared:**
   ```bash
   wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
   chmod +x cloudflared-linux-amd64
   sudo mv cloudflared-linux-amd64 /usr/local/bin/cloudflared
   ```

2. **Create quick tunnel:**
   ```bash
   cloudflared tunnel --url http://localhost:8000
   ```

3. **Get your URL from the output** (looks like: https://xxx.trycloudflare.com)

**Pros:**
- ✅ Free forever
- ✅ Fast and reliable
- ✅ No registration needed for quick tunnels
- ✅ HTTPS included

---

### Option 3: Port Forwarding (Permanent, Advanced)

If you have access to your router:

1. **Log into your router** (usually 192.168.1.1 or 192.168.0.1)

2. **Find "Port Forwarding" section**

3. **Add rule:**
   - External Port: 8000
   - Internal IP: 21.0.0.102
   - Internal Port: 8000
   - Protocol: TCP

4. **Find your public IP:**
   ```bash
   curl ifconfig.me
   ```

5. **Access via:** http://[your-public-ip]:8000

**Pros:**
- ✅ Direct connection
- ✅ Full control
- ✅ No third-party service

**Cons:**
- ❌ Requires router access
- ❌ May need to update firewall
- ❌ Public IP might change (unless static)
- ❌ Security considerations (exposing port)

---

### Option 4: SSH Tunnel (If you have SSH access)

From your local computer:

```bash
ssh -L 8000:localhost:8000 user@21.0.0.102
```

Then access locally at: http://localhost:8000

**Pros:**
- ✅ Secure
- ✅ No extra software on server

**Cons:**
- ❌ Only you can access it
- ❌ Requires SSH access
- ❌ Must keep SSH connection open

---

## 🚀 Quick Start: Ngrok (Recommended)

**Complete Setup:**

```bash
# 1. Download ngrok
cd /home/user/scoreboard
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar xzf ngrok-v3-stable-linux-amd64.tgz

# 2. Start ngrok (in a new terminal/screen)
./ngrok http 8000

# The output will show something like:
# Forwarding: https://a1b2-c3-d4-e5-f6.ngrok-free.app -> http://localhost:8000
```

**Copy that ngrok URL and use it anywhere!**

Example ngrok URL:
```
https://a1b2-c3-d4-e5-f6.ngrok-free.app/views/operator.html
```

---

## 🔒 Security Considerations

When exposing your scoreboard to the web:

1. **No authentication by default** - Anyone with the URL can access it
2. **Consider using ngrok password protection:**
   ```bash
   ngrok http 8000 --basic-auth="username:password"
   ```
3. **Only share URL with people who need it**
4. **Stop tunnel when not in use**

---

## 📱 Mobile Access

Once you have a public URL (from ngrok/cloudflare):

**Operator Panel:**
```
https://your-ngrok-url.ngrok-free.app/views/operator.html
```

**Scoreboard Display:**
```
https://your-ngrok-url.ngrok-free.app/views/standard.html
```

**Works on:**
- ✅ Phones
- ✅ Tablets
- ✅ Any device with a browser

---

## Troubleshooting

### Ngrok shows "ERR_NGROK_108"
- Free tier connection limit reached
- Wait or upgrade to paid plan

### Can't download ngrok
- Try from local machine and upload via scp
- Use Cloudflare tunnel instead

### Tunnel disconnects
- Run in screen/tmux:
  ```bash
  screen -S ngrok
  ./ngrok http 8000
  # Press Ctrl+A then D to detach
  ```

### Need permanent URL
- Sign up for ngrok account (free)
- Get static domain
- Or use Cloudflare tunnel with custom domain

---

## Next Steps

1. **Choose your method** (ngrok recommended for testing)
2. **Start the tunnel**
3. **Get your public URL**
4. **Share and test!**

Your scoreboard is ready - you just need to expose it to the web! 🚀
