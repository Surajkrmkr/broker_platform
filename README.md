# 💹 Broker Platform

A Flutter-based frontend application that simulates a multi-broker trading platform with login, navigation, and trade management interfaces. Built using static mocked data as per the assignment requirements.

---

## 🚀 Features

- 🔐 **Broker Login System**

  - Select a broker from a list
  - Simulated backend responses (200, 400, 500) with UI handling

- 🧭 **Bottom Navigation**

  - Switch between `Holdings`, `Orderbook`, and `Positions` screens
  - Each screen displays mocked stock data

- 💰 **PNL Cards**

  - Realized and Unrealized PNL summary in Orderbook & Positions screens

- 🎯 **Buy/Sell Order Pad**

  - Tap any stock to open order pad
  - UI changes dynamically for Buy (green) or Sell (red)

- ✨ **Draggable Floating Action Button (FAB)**
  - Expandable FAB to Buy/Sell top-listed stock or alphabetically first one

---

## 📦 Tech Stack

- **Flutter** (UI)
- **Dart** (Logic & models)
- **Stateless architecture** (lightweight and simple)
- **Mocked data** (in `.dart` files instead of API calls)

---
