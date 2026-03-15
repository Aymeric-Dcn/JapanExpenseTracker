![Platform](https://img.shields.io/badge/platform-iOS-blue)
![Swift](https://img.shields.io/badge/Swift-5-orange)
![SwiftUI](https://img.shields.io/badge/UI-SwiftUI-green)
# Japan Expense Tracker 🇯🇵💸

A simple iOS application built with **SwiftUI** to track daily expenses during a trip to Japan.

The app was designed to quickly record expenses (cash or card), monitor remaining cash after withdrawals, and visualize spending through simple statistics.
## Requirements

- iOS 17+
- Xcode 15+
- Swift 5

## Features

- Add daily expenses
- Categorize expenses (food, transport, shopping, etc.)
- Track **cash withdrawals**
- Automatic **cash remaining calculation**
- Filter expenses by:
  - Day
  - Week
  - Month
  - Total
- Filter by payment method:
  - Cash
  - Card
  - All
- Currency toggle:
  - Yen (¥)
  - Euro (€)
- Basic spending statistics
- Simple bar chart visualization
- Persistent local storage using JSON

## Screens

The app currently includes:

- **Dashboard**
  - Remaining cash
  - Total spent

- **Add Expense**
  - Amount
  - Category
  - Note
  - Payment method

- **Withdraw Cash**
  - Record ATM withdrawals

- **Expenses**
  - Filterable list
  - Simple bar chart visualization
  - Spending totals for:
    - Today
    - This week
    - This month
    - Total

## Tech Stack

- **Swift**
- **SwiftUI**
- **Combine**
- Local persistence with **JSON**
- iOS native development with **Xcode**

## Data Storage

Expenses and withdrawals are stored locally in the application's **Documents Directory** using JSON files.

This allows data to persist between app launches without requiring a database or internet connection.

## Project Structure
```
JapanExpenseTracker/
│
├── Models
│ └── Expense.swift
│
├── Managers
│ └── ExpenseManager.swift
│
├── Views
│ ├── ContentView.swift
│ ├── AddExpenseView.swift
│ ├── AddWithdrawalView.swift
│ ├── ExpensesView.swift
│ └── StatsView.swift
│
└── JapanExpenseTrackerApp.swift
```
## Possible Future Improvements

- Category spending pie chart
- Weekly spending comparison
- Budget limits and alerts
- CSV export
- iCloud synchronization
- Improved UI/UX design
- Android version (Kotlin)
- Adding currencies (World wide Expense Tracker)

## Motivation

This project was created as a personal tool to track spending during a trip to Japan for an internship while also learning **iOS development with SwiftUI**.

The goal was to build a **simple, practical, and lightweight expense tracker** focused on travel.

## Author

Aymeric Duchene
