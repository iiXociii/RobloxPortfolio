# Coin System with Rebirth & Friend Boost

## Description

A coin system built for Roblox games that includes:

- Rebirth mechanic with a persistent coin multiplier
- Friend boost system that rewards players for being in-game with friends
- Real-time coin UI updates with animated feedback
- Data saving using ProfileService (coins, rebirths, multiplier)

This system is designed to be modular and adaptable for any simulator-style Roblox game.

---

## 🎮 Features

- 💰 Coins: Gain coins automatically over time.
- 🔁 Rebirth: Spend coins to reset progress and increase your multiplier.
- 🤝 Friend Boost: Detects in-game friends and increases gain rate.
- 💾 Saves: Uses ProfileService to save data between sessions.
- 🖥️ Coin GUI: Real-time updates with bonus indicators.
- ✅ API-Ready: Works with live DataStores outside of Studio.

---

## 📂 File Structure

- `AutoCashGiver` – Adds coins periodically, considering multiplier and friend boost.
- `RebirthHandler` – Server-side rebirth logic.
- `CoinLeaderstats` – Links leaderstats with ProfileService values.
- `DataManager` – Loads and manages profiles.
- `ProfileService` – Stores: Cash, Rebirths, Multiplier.
- `UI` – Simple GUI: CoinLabel, BoostLabel, RebirthButton (with effects).

---

## 🧪 Notes

To test saving in Studio:
- Enable **API Services** in `Home > Game Settings > Security`.

To use the friend boost:
- Publish the place and play with a friend in the same server.
