# Game Design Document — Territory Pet: Open World Land Strategy
**Version:** 0.2 — Merged Concept  
**Author:** Huy Pham  
**Last Updated:** 2026-05-08  
**Status:** Active Development  
**Merged from:** `gdd-territory-pet.md` + `game-open-world-land-strategy.md`

---

## 1. Elevator Pitch

> **Territory Pet** là game kết hợp **open world land strategy** + **idle automation** + **pet RPG** trên mobile.
>
> Mày là lord của một lãnh thổ trong thế giới mở. Pet của mày tự động khám phá, khai thác, và bảo vệ đất đai.  
> Mày chỉ set strategy — thế giới tự sống, tự chiến đấu.
>
> **"Pet làm việc cho mày. Đất đai có ký ức. Thế giới không bao giờ ngủ yên."**

---

## 2. Genre & Platform

| Field | Value |
|-------|-------|
| Genre | Idle Automation + Open World Territory Strategy + Pet RPG |
| Platform | Mobile (iOS & Android), Web prototype |
| Perspective | Top-down 2D |
| Mode | Single-player campaign + Async PvP (Season) |
| Target Audience | Casual → Mid-core, 18–35 tuổi |
| Monetization | F2P — Speed + Cosmetics, no pay-to-win |

---

## 3. Core Fantasy

Player là **lord của một vùng đất trong thế giới mở vô tận** — không phải người trực tiếp lao động, mà là người dẫn dắt. Pet của mày tự chạy ra ngoài, tự khám phá, tự harvest, tự đánh trả kẻ xâm chiếm.

Mày ngồi quan sát — thấy lãnh thổ dần mở rộng, thấy pet chạy qua cánh đồng, thấy kẻ thù đến rồi bị đẩy lui — và thỉnh thoảng ra quyết định chiến lược thay đổi tất cả.

---

## 4. What Makes This Different

| vs. | Cái họ thiếu | Cái mình có |
|-----|-------------|-------------|
| Rise of Kingdoms | Land generic, không có character | Land có hidden profile, memory, seasonal behavior |
| Clash of Clans | Không có open world | Procedural open world, fog of war thật sự |
| Evony | UX cổ lỗ sĩ, heavy micro | Pet tự động, user chỉ set strategy |
| Manor Lords | Fixed map, PC only | Open world mobile, async PvP |
| GoPet | Player làm việc cho pet | Pet làm việc cho player |

---

## 5. Core Loop

```
[Hatch Pet] → [Assign Work Order] → [Pet Auto-Explore World]
      ↑                                         ↓
[Upgrade Pet/Land] ← [Collect Resources] ← [Harvest / Discover Tile]
      ↑                                         ↓
[Expand Territory] ←——————————————— [Reveal Hidden Land Value]
      ↑                                         ↓
[Season Leaderboard] ←———— [Async PvP Raids] ←—[Border Conflict]
```

### Session Loop (5–10 phút):
1. Check pet đang làm gì
2. Adjust work order nếu cần
3. Spend resources: upgrade pet / claim tile / build
4. Watch pets work → dopamine
5. Close app → pets tiếp tục offline

---

## 6. Open World Land System

### 6.1 World Structure
- Map **procedural infinite** — mỗi player có world instance riêng
- Chia ô **hex** (PvP map) hoặc **square** (personal territory)
- Fog of war bao phủ toàn bộ, unlock dần theo explore
- World seed unique per player → không ai có map giống nhau

### 6.2 Tile Types

| Tile | Resource | Special Mechanic |
|------|----------|-----------------|
| 🌾 Grassland | Food | Base tile, dễ farm, fertility giảm nếu overcrop |
| 🌲 Forest | Wood + Herbs | Slow harvest, high yield, regrow theo time |
| ⛰️ Mountain | Stone + Ore | Cần Mining skill, không bao giờ cạn kiệt |
| 💧 River | Water + Fish | Boost adjacent farm tiles +30% |
| 🌑 Ruins | Random rare loot | Danger zone, cần combat pet, one-time bonus |
| 🌿 Wetland | Special herbs | Crafting materials, seasonal only |
| 🏜️ Wasteland | Nothing → Cleansed | Phải invest resource để restore |

### 6.3 Land Character (Key Differentiator)
Mỗi tile có **hidden profile** — player phải discover:
- **Fertility** (1–10): Food yield multiplier
- **Danger** (1–10): Chance of enemy spawn
- **Resource Density** (1–10): Harvest amount
- **Memory**: Lịch sử tile ảnh hưởng hiện tại
  - Chiến trường cũ → Haunted (enemy spawn +50%, rare drop +30%)
  - Long-farmed → Depleted (yield -50% trừ khi rest/restore)
  - Ancient ruins → bonus Crystals

### 6.4 Seasonal Effects

| Season | Effect |
|--------|--------|
| 🌸 Spring | Yield +20%, Forest regrow x2 |
| ☀️ Summer | Yield +50%, Water tiles bonus |
| 🍂 Autumn | Yield normal, prepare for winter |
| ❄️ Winter | Yield -60%, Grass frozen, Mountain +20% |

### 6.5 Territory Expansion
- Start: 3x3 personal territory
- Expand: claim adjacent tile + pay resource cost
- Influence radius: strong buildings extend soft claim radius (Civ VI style)
- Disputed tiles: nếu 2 players claim cùng 1 tile → async battle

---

## 7. Pet System

### 7.1 Pet Types

| Type | Role | Auto-Behavior |
|------|------|---------------|
| 🐕 Worker | Farming, harvesting | Tìm nearest resource tile, harvest loop |
| 🦊 Scout | Exploration | Chạy fog of war, reveal tiles, hidden profile |
| 🐺 Guardian | Defense | Patrol border, attack invaders |
| 🐦 Courier | Logistics | Chuyển resource giữa tiles, giảm waste |
| 🐉 Elite | Combat + Special | Boss fight, rare resource tiles, raid |

### 7.2 Pet Stats
- **Stamina** — Work duration trước khi cần rest
- **Speed** — Di chuyển & harvest speed
- **Strength** — Combat + harvest yield
- **Bond** — Gắn kết với player → passive bonus toàn map
- **Specialty** — Tile type mà pet hiệu quả nhất (e.g., Forest specialist +50%)

### 7.3 Pet Progression
```
Egg → Hatchling → Juvenile → Adult → Evolved (Unique Form)
```
- Level up từ XP khi work
- Evolve cần rare materials + max level + Bond cao
- Bond tăng: feed, let them complete tasks, pet interaction

### 7.4 Work Orders
- **AUTO** — Pet tự quyết theo AI priority
- **FARM** — Focus harvest, ignore combat
- **EXPLORE** — Reveal fog of war ưu tiên
- **DEFEND** — Stay border, attack any threat

---

## 8. Resource System

| Resource | Source | Used for |
|----------|--------|---------|
| 🌾 Food | Grassland | Pet stamina, population growth |
| 🪵 Wood | Forest | Buildings, upgrade |
| 🪨 Stone | Mountain | Fortification, advanced buildings |
| ⚗️ Herbs | Forest/Wetland | Pet healing, crafting |
| 💎 Crystals | Ruins/rare tiles | Premium upgrades, evolve |
| 🌟 Essence | Pet bond milestones | Special abilities, world events |

---

## 9. Building System

| Building | Effect | Cost |
|----------|--------|------|
| 🏠 Cottage | +1 pet slot, +Bond gain | 20W 10S |
| 🌾 Granary | Storage x2, prevent spoil | 15W |
| ⚒️ Workshop | Craft speed +50% | 25W 15S |
| 🗼 Watchtower | Scout range +3, reveal fog auto | 20S |
| 🏰 Keep | Territory max +10, defense +30% | 50W 50S |
| 🌿 Herbary | Herb yield x2, pet heal faster | 20W 10H |
| 🛡️ Barracks | Guardian spawn, defense bonus | 30S 20W |

---

## 10. Async PvP — Season System

### Season Structure (30 days)
- Leaderboard: Territory size × Resource yield × Pet level score
- Top 10% → exclusive cosmetics + next season head start

### Raid Mechanic
- Send 1 pet → "contest" border tile of neighbor
- Defender pet auto-defend (no action needed)
- Resolved in background: winner = higher Strength + Tile bonus
- Can only raid 3x/day (prevent harassment)

### Alliance System (v2)
- Form alliance → shared border = no raid
- Trade resources across alliance
- Alliance war: top alliance vs top alliance, season finale

---

## 11. Monetization

**Philosophy:** Free players can achieve everything, just slower.

| Item | Type | Price |
|------|------|-------|
| Speed-up tokens | Consumable | $0.99–$2.99 |
| Rare Egg (guaranteed type) | Direct buy | $3.99 |
| Pet skins | Cosmetic | $2.99–$4.99 |
| Territory themes (biome skin) | Cosmetic | $3.99 |
| Extra pet slots (3→5) | Permanent QoL | $4.99 |
| Season Pass | Sub $4.99/month | Cosmetics + XP boost |
| Land deed (name your tile) | Vanity | $0.99 |

---

## 12. Art Direction

- **Style:** Cozy pixel art, warm earthy palette
- **Perspective:** Top-down, slight isometric feel
- **Pet design:** Cute + slightly wild — personality-driven
- **Map feel:** Living, breathing — grass sways, seasons visually change map
- **References:** Stardew Valley × Northgard × Hive × Against the Storm

---

## 13. Tech Stack

### Phase 1 — Prototype (Month 1–2)
```
Engine:   Phaser.js (web, fast iteration) ✅ DONE
Backend:  None — local state only
Goal:     Test core loop feel with 50 testers
```

### Phase 2 — MVP Mobile (Month 2–5)
```
Engine:   Unity (iOS + Android)
Backend:  Node.js + Colyseus (async multiplayer)
DB:       Supabase (free tier → scale)
Hosting:  Fly.io (~$20/month)
```

### Phase 3 — Scale (Post-launch)
```
Backend:  Horizontal scale on Fly.io
DB:       PlanetScale (sharding)
Analytics: Mixpanel
Push:     Firebase Cloud Messaging
```

---

## 14. MVP Scope (v0.1) — Checklist

**IN:**
- [x] 12x10 map, fog of war — Phaser prototype
- [x] Worker + Scout pet, auto-harvest loop
- [x] 4 tile types, hidden resources
- [x] Stamina system, work orders
- [x] Season system (Spring/Summer/Autumn/Winter)
- [x] Click-to-claim territory
- [x] Resource UI
- [ ] Building placement (Cottage, Granary)
- [ ] Enemy faction AI auto-expand
- [ ] Offline progress

**NOT in MVP:**
- ❌ PvP / Raids
- ❌ Pet evolve
- ❌ Alliance
- ❌ Monetization
- ❌ Mobile build

**Green light criteria:** 50 testers, 30%+ Day 7 retention.

---

## 15. Roadmap

| Phase | Timeline | Milestone |
|-------|----------|-----------|
| Prototype | Done ✅ | Phaser.js playable |
| Alpha | Month 2–3 | Buildings, enemy AI, offline |
| Beta | Month 4–5 | Unity mobile, 100 testers |
| Soft Launch | Month 6 | SEA market, F2P monetize live |
| Season 1 | Month 7 | Async PvP, leaderboard |
| Global | Month 9+ | Alliance, world events |

---

## 16. Open Questions

- [ ] Offline progress — pet vẫn work khi app closed? (recommend: yes, capped 8h)
- [ ] Map size — infinite expand hay capped per season?
- [ ] Pet death — permadeath hay chỉ "exhausted"? (recommend: no permadeath MVP)
- [ ] Multiplayer — shared world hay isolated instances?
- [ ] Land trading — player-to-player land trade? (interesting but complex)
- [ ] Web3/NFT — avoid completely for now

---

*Living document — cập nhật sau mỗi playtest.*
