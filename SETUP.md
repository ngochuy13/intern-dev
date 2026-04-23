# Autonomous Intern — Setup Guide

Repo này chứa workspace của **Dev Quyền** — AI intern chạy trên OpenClaw.

---

## Prerequisites

- [OpenClaw](https://openclaw.ai) đang chạy
- Node.js 20+
- Python 3.x
- [Bun](https://bun.sh) (cài tự động qua script bên dưới)

---

## 1. Clone repo vào OpenClaw workspace

```bash
cd /root/openclaw/workspace
git init
git remote add origin https://github.com/ngochuy13/intern-dev.git
git fetch origin
git reset --hard origin/main
```

---

## 2. Cài GBrain

```bash
git clone https://github.com/garrytan/gbrain.git ~/gbrain
cd ~/gbrain
curl -fsSL https://bun.sh/install | bash
export PATH="$HOME/.bun/bin:$PATH"
bun install && bun link
```

Verify:
```bash
gbrain --version
```

---

## 3. Khởi tạo Brain database

```bash
gbrain init
```

---

## 4. Set API Keys

```bash
# Thêm vào ~/.bashrc
export OPENAI_API_KEY="your-openai-key"       # bắt buộc cho vector search
export PATH="$HOME/.bun/bin:$PATH"

source ~/.bashrc
```

---

## 5. Import workspace vào Brain

```bash
cd /root/openclaw/workspace
gbrain import . --no-embed
gbrain embed --stale
```

Verify:
```bash
gbrain query "Huy server IP"
```

---

## 6. Cài PinchChat (optional WebUI)

```bash
git clone https://github.com/MarlBurroW/pinchchat.git ~/pinchchat
cd ~/pinchchat

# Edit .env
echo 'VITE_CLIENT_ID=openclaw-control-ui' > .env

npm install
npm run build

# Cài systemd service
sudo tee /etc/systemd/system/pinchchat.service > /dev/null << 'EOF'
[Unit]
Description=PinchChat UI
After=network.target

[Service]
Type=simple
WorkingDirectory=/root/pinchchat
ExecStart=/usr/bin/npx vite preview --port 3000 --host 0.0.0.0
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable pinchchat
sudo systemctl start pinchchat
```

Access: `http://<server-ip>:3000`
Gateway URL: `ws://<server-ip>:18789`

---

## 7. OpenClaw config cần thiết

Thêm vào `openclaw.json`:

```json
{
  "gateway": {
    "bind": "lan",
    "controlUi": {
      "allowedOrigins": ["*"],
      "dangerouslyDisableDeviceAuth": true
    }
  },
  "channels": {
    "telegram": {
      "groupPolicy": "open",
      "groups": {
        "*": { "requireMention": true }
      }
    }
  }
}
```

---

## 8. Cron Jobs tự động

Setup trong OpenClaw cron hoặc crontab:

```bash
# GBrain sync every 15 min (git-aware, tự pull + sync + embed)
*/15 * * * * gbrain sync --repo /root/openclaw/workspace && gbrain embed --stale

# GBrain dream cycle — nightly 2am
0 2 * * * export OPENAI_API_KEY='your-key' && gbrain extract links --source db && gbrain extract timeline --source db
```

---

## Services checklist

| Service | Port | Command |
|---|---|---|
| OpenClaw Gateway | 18789 | `systemctl start openclaw` |
| PinchChat | 3000 | `systemctl start pinchchat` |
| GBrain | — | `gbrain serve` (MCP) |

---

## Exa Web Search

Skill `exa-web-search` dùng trực tiếp Exa API:
- Key lưu tại: `skills/exa-web-search/search.sh`
- API key hiện tại: `ecdadd75-6364-43ff-9568-26017d9772c1`
