# Game Design Document — Territory Pet
**Version:** 0.1 — Draft  
**Author:** Huy Pham  
**Last Updated:** 2026-05-08  
**Status:** Brainstorm → MVP Planning

---

## 1. Elevator Pitch

> **Territory Pet** là game idle automation + territory expansion trên mobile.  
> Player nuôi pet, pet tự động làm việc trong lãnh thổ — harvest, explore, defend.  
> User chỉ set strategy, watch the world come alive.  
> **"Pet làm việc cho mày, không phải mày làm việc cho pet."**

---

## 2. Genre & Platform

| Field | Value |
|-------|-------|
| Genre | Idle Automation + Territory Strategy + Pet RPG |
| Platform | Mobile (iOS & Android), Web prototype |
| Perspective | Top-down 2D |
| Mode | Single-player + Async PvP (Season) |
| Target Audience | Casual → Mid-core, 18–35 tuổi |

---

## 3. Core Fantasy

Player cảm thấy như một **lord/queen** đứng nhìn lãnh thổ của mình phát triển — pet chạy quanh, đất được khai thác, ngôi làng lớn dần. Thỉnh thoảng can thiệp để set hướng đi, còn lại thì thư giãn xem thế giới sống.

---

## 4. Core Loop

```
[Hatch Pet] → [Assign Work Order] → [Pet Auto-Explore]
      ↑                                      ↓
[Upgrade Pet/Land] ← [Collect Resources] ← [Harvest Tile]
      ↑                                      ↓
[Expand Territory] ←————————————— [Reveal New Land]
```

### Loop chi tiết:

1. **Hatch** — Nhận pet ban đầu (random type/rarity)
2. **Assign** — Set work order: Farm / Explore / Defend / Gather
3. **Auto-run** — Pet tự di chuyển, tự làm việc trên map
4. **Harvest** — Tài nguyên tự vào kho sau delay
5. **Upgrade** — Dùng resource để upgrade pet stat / unlock skill
6. **Expand** — Claim tile mới → lộ hidden resource → tăng income
7. **Repeat**

---

## 5. Land System

### 5.1 Tile Types

| Tile | Resource | Special |
|------|----------|---------|
| 🌾 Grassland | Food | Base tile, dễ farm |
| 🌲 Forest | Wood + Herbs | Slow harvest, high yield |
| ⛰️ Mountain | Stone + Ore | Cần pet có Mining skill |
| 💧 River | Water + Fish | Boost adjacent farm tiles |
| 🌑 Ruins | Random rare loot | Danger zone, cần combat pet |
| 🌿 Wetland | Special herbs | Crafting materials |

### 5.2 Land Character
- Mỗi tile có **hidden profile** (Fertility, Danger, Resource Density)
- Phải send Scout pet để reveal full stats
- Tile có **memory**: nếu bị overcrop → Fertility giảm vĩnh viễn
- Seasonal effect: Winter → tất cả tile giảm 50% output

### 5.3 Territory Expansion
- Start với 3x3 tiles
- Expand bằng cách: claim adjacent tile + pay resource cost
- Mỗi tile mới = fog of war → pet phải khám phá trước

---

## 6. Pet System

### 6.1 Pet Types

| Type | Role | Auto-Behavior |
|------|------|---------------|
| 🐕 Worker | Farming, harvesting | Tìm nearest resource tile, harvest loop |
| 🦊 Scout | Exploration | Chạy fog of war, reveal tiles |
| 🐺 Guardian | Defense | Patrol border, attack invaders |
| 🐦 Courier | Logistics | Chuyển resource giữa tiles nhanh hơn |
| 🐉 Elite | Combat + Special | Boss fight, rare resource tiles |

### 6.2 Pet Stats
- **Stamina** — Work duration trước khi cần rest
- **Speed** — Di chuyển & harvest speed
- **Strength** — Combat + harvest yield
- **Bond** — Gắn kết với player → passive bonus toàn map
- **Specialty** — Tile type mà pet hiệu quả nhất

### 6.3 Pet Progression
```
Egg → Hatchling → Juvenile → Adult → Evolved
```
- Level up bằng XP từ work
- Evolve cần rare materials + max level
- Bond tăng bằng: feed, interact, let them complete tasks

### 6.4 Work Orders
Player assign 1 trong 4 orders:
- **AUTO** — Pet tự quyết, ưu tiên theo AI logic
- **FARM** — Focus harvest, ignore combat
- **EXPLORE** — Reveal new tiles ưu tiên
- **DEFEND** — Stay border, attack threats

---

## 7. Resource System

| Resource | Source | Used for |
|----------|--------|---------|
| 🌾 Food | Grassland | Pet stamina restore, population |
| 🪵 Wood | Forest | Building, upgrade |
| 🪨 Stone | Mountain | Building, fortification |
| ⚗️ Herbs | Forest/Wetland | Crafting, pet healing |
| 💎 Crystals | Ruins/rare tiles | Premium upgrade, evolve |
| 🌟 Essence | Pet bond actions | Special abilities unlock |

---

## 8. Building System (Minimal)

Buildings đặt trong territory, boost automatic behavior:

| Building | Effect |
|----------|--------|
| 🏠 Cottage | +1 pet slot, +Bond gain |
| 🌾 Granary | Resource storage x2 |
| ⚒️ Workshop | Craft speed +50% |
| 🗼 Watchtower | Pet Scout range +3 tiles |
| 🏰 Keep | Territory max size +10 |

---

## 9. Progression Arc

### Phase 1 — Foundation (Day 1–7)
- 1 pet, 3x3 map
- Learn core loop
- First expand

### Phase 2 — Growth (Day 7–30)
- 2–3 pets, 10x10 map
- Specialization (assign roles)
- First season rank

### Phase 3 — Endgame (Day 30+)
- Full team (5 pets), large territory
- Elite zones, boss encounters
- PvP: territory raids async

---

## 10. Monetization

**Philosophy:** Never pay-to-win. Pay for speed + cosmetics.

| Item | Type | Price |
|------|------|-------|
| Speed-up tokens | Consumable | $0.99–$2.99 |
| Rare Egg (random type) | Gacha | $1.99 |
| Pet skins | Cosmetic | $2.99–$4.99 |
| Territory themes | Cosmetic | $3.99 |
| Extra pet slots | Permanent | $4.99 |
| Season Pass | Subscription | $4.99/month |

**Free player path:** Fully playable, slower pace = intended experience.

---

## 11. Async PvP — Season System

- Every 30 days = 1 Season
- Leaderboard based on: Territory size × Resource yield × Pet level
- Top 10% get exclusive cosmetics
- **Raid mechanic:** Send 1 pet to "contest" opponent's border tile
  - Defender pet auto-defend
  - No real-time needed — resolved in background

---

## 12. Art Direction

- **Style:** Cozy pixel art, warm palette
- **Perspective:** Top-down, slight isometric feel
- **Pet design:** Cute + slightly wild — not baby-faced, not brutal
- **Map feel:** Living, breathing — grass sways, water ripples, pets animate constantly
- **Reference:** Stardew Valley × Northgard × Hive

---

## 13. Tech Stack (Recommended)

### Prototype (Month 1–2)
```
Engine:   Phaser.js (web browser, fast iteration)
Backend:  None (local state only)
Goal:     Test core loop feel
```

### MVP (Month 2–4)
```
Engine:   Unity (mobile build)
Backend:  Node.js + Colyseus (multiplayer)
DB:       Supabase (free tier)
Hosting:  Fly.io (~$20/month)
```

### Scale (Post-launch)
```
Backend:  Scale horizontally on Fly.io
DB:       Migrate to PlanetScale if needed
Analytics: Mixpanel (free tier)
```

---

## 14. MVP Scope (v0.1)

**Cut everything, keep only:**
- [ ] 10x10 map, fog of war
- [ ] 1 pet type (Worker)
- [ ] 3 tile types (Grass, Forest, Mountain)
- [ ] Auto-harvest loop
- [ ] Resource collection
- [ ] 2 buildings (Cottage, Granary)
- [ ] Expand territory mechanic

**NOT in MVP:**
- ❌ PvP / Seasons
- ❌ Multiple pet types
- ❌ Evolve system
- ❌ Raids
- ❌ Monetization

**Goal:** 50 testers say "I want to keep playing" = green light.

---

## 15. Open Questions

- [ ] Offline progress — pet vẫn work khi app closed?
- [ ] Map size limit — infinite expand hay capped per season?
- [ ] Pet death — có permadeath không hay chỉ "exhausted"?
- [ ] Multiplayer map — shared world hay isolated?
- [ ] Web3/NFT — tránh hoàn toàn hay consider?

---

*GDD này là living document — update liên tục khi idea thay đổi.*
