# gtts-mvp
GTTS — Global Truck Toll &amp; Services (MVP)
# GTTS — Global Truck Toll & Services (MVP)

GTTS is a mobile-first platform for truck fuel payments and road toll services,
designed as a future EETS-compatible solution.

This repository contains an MVP Flutter application with:
- Station-based fueling flow
- Geofence & fraud prevention
- Credit engine (pre-authorization)
- Hidden TEST MODE admin panel
- Google Maps integration

---

## 🚛 Key Features (MVP)

- 📍 Select fuel station on map
- ⛽ Start fueling directly from station
- 🧭 Geofence validation (anti-fraud)
- 💳 Credit pre-authorization & blocking
- 🧠 Rule-based fraud engine
- 🔄 Fuel session lifecycle (polling)
- 🧪 TEST MODE admin panel (hidden)

---

## 📱 Platforms

- Android ✅
- iOS ✅
- Flutter (Riverpod)

---

## 🧪 TEST MODE

### Open Admin Panel
On **Fuel screen**, tap the title **7 times**.

Admin features:
- Change geofence radius
- Simulate network errors
- Simulate pre-auth decline
- Slow network simulation
- Reset credit / fraud / sessions
- Copy logs

---

## 🗺️ Fueling Flow

1. Open **Map**
2. Select a fuel station
3. Tap **START FUELING HERE**
4. Complete fueling flow in **Fuel** tab

---

## 🔧 Setup

### Requirements
- Flutter 3.x
- Android Studio / Xcode
- Google Maps API key

### Install dependencies
```bash
flutter pub get
