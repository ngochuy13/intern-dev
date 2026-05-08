# Game Ý Tưởng: Thế Giới Mở - Chiến Thuật Lãnh Địa

**Ingested:** 2026-05-08
**Source:** Huy Pham (Telegram)

## Concept

Game chiến thuật thế giới mở, bản đồ dạng bàn cờ 1000x1000 cell. Thế giới tu tiên / dị giới (không phải map VN).

## Core Loop

1. Đăng ký → nhận quà tân thủ (random ô đất miễn phí)
2. Quay số bóc thăm → mua ô đất (29k = vàng + 3 lượt rút)
3. Khai thác tài nguyên theo ô đất đã sở hữu
4. Build quân đội → đánh chiếm vùng đất khác
5. Quay lại bước 2 — monetization loop

## Map Design

- Grid 1000x1000 cells
- Mỗi cell có: `type` / `status` / `state` (3 fields riêng biệt)
- Cell types: núi đá, vực thẳm, biển, sông, đầm lầy (static obstacles), đất bình thường, đất đặc biệt
- Obstacle cells: không thể mua, không thể đi qua → ép user mua đất lân cận hoặc đi xuyên lãnh địa người khác → sinh mâu thuẫn, thuế lãnh địa
- Một số obstacle có thể cải tạo bởi user

## Monetization

- 29k VND = vàng + 3 lượt rút đất
- Tân thủ: random 1 ô đất miễn phí
- Quay số bóc thăm random ô đất

## Social & Meta

- Cắm cờ lãnh địa (cá nhân hóa ô đất)
- Thu thuế khi người khác đi qua lãnh địa
- Mâu thuẫn cá nhân, thể hiện sức mạnh, quyền lực

## Gameplay

- Bot characters diễn cảnh sinh hoạt khai thác tài nguyên (không phải user điều khiển trực tiếp)
- Kết hợp nhiều loại chiến thuật nhưng đơn giản hoá
- Casual, giết thời gian, cuốn

## Phase 1 Scope

Bản đồ nhỏ: 1 vương quốc. Validate core loop trước khi scale.

## Phase 1 Must-Haves (Critical Loop)

- Mua đất (quay số) — cốt lõi monetization
- Khai thác tài nguyên — reason to log in daily
- Build quân — progression system
- Đánh chiếm đất — conflict & engagement driver
- Cắm cờ — personalization & identity
- Thuế lãnh địa — passive income loop, tăng conflict

## Technical Notes

- Cell schema: `{ type, status, state, owner_id, flag, resources }`
- AI-generated cell type structure → user review → finalize
- Map rendering: grid-based, mark owned cells

## Open Questions

- Economy balance: resource rates vs upgrade costs?
- PvP protection cho tân thủ?
- Phase 1 map size bao nhiêu ô là đủ?
- Offline progression hay chỉ khi online?
