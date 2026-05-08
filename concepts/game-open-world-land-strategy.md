# Game Design Document — Open World Land Strategy (Brainstorm Notes)
**Version:** 0.1 — Raw Brainstorm  
**Source:** Chat session 2026-05-08  
**Status:** Raw ideas → merged into GDD Territory Pet

---

## Original Concept Ideas

### 1. "Terra Claim" — Real-time land conquest
- Map procedural, chia ô hex
- Mỗi ô có resource type (forest, ore, water)
- Build outposts → expand influence radius
- Other players/factions counter-claim → chiến tranh kinh tế

### 2. "Epoch Rise" — Civilization từ stone age
- Start với 1 settler, open world khổng lồ
- Khám phá terrain → unlock tech
- Diplomacy, trade routes, war — tất cả real-time
- First-person exploration kết hợp macro strategy

### 3. "Fractured Lands" — Post-apocalypse faction war
- Đất đai bị ô nhiễm, phải "cleanse" để dùng
- Land = tài nguyên khan hiếm → tranh giành căng
- Factions có ideology khác nhau → ảnh hưởng playstyle

---

## Mechanics Researched (from competitor games)

| Mechanic | From | Notes |
|----------|------|-------|
| Organic zoning | Foundation | Paint zone → AI tự build |
| Per-plot resource | Manor Lords | Hidden profile, reveal khi survey |
| Seasonal scarcity | Northgard | Winter giảm yield |
| Biome-based economy | Against the Storm | Biome → tech tree unlock |
| Species preference | Against the Storm | Faction asymmetric |
| Land memory | Dwarf Fortress | Lịch sử đất → haunted/fertile |
| Terrain deformation | Minecraft/Valheim | Permanent terrain change |
| Influence radius | Civilization VI | City emit influence |
| Land degradation | Frostpunk 2 | Overcrop → tile kiệt |
| Supply chain distance | Anno 1800 | Xa capital = cao cost |
| Real estate speculation | Offworld Trading Co. | Land price fluctuates |
| Fog of war + scouting | Total War | Intel warfare |
| Diplomacy over land | Crusader Kings III | Marry/buy/inherit đất |
| Procedural events | RimWorld | Random events on specific land |
| Vertical land | Cultures series | Altitude bonus |

---

## Target: PvP Mobile

**Core Loop:**
```
Explore → Scout → Claim → Build → Defend/Attack → Trade
```

**Competitors to beat:**
- Rise of Kingdoms (land generic)
- Clash of Clans (no open world)
- Evony (old UX)

**Gap:** Land có character thật (hidden resources, memory, seasonal)
