# CarZone 🚗

> An iOS app that helps used car sellers efficiently manage and track their vehicle inventory.

## 📱 Screenshots
<img width="326" height="644" alt="Screenshot 2026-04-28 at 11 45 24 AM" src="https://github.com/user-attachments/assets/9fc7c01e-bf46-4cb3-b491-d79ec12c9213" />
<img width="324" height="644" alt="Screenshot 2026-04-28 at 11 45 55 AM" src="https://github.com/user-attachments/assets/642af64b-8d33-41b7-b0da-fb1ab45a4bb6" />
<img width="314" height="639" alt="Screenshot 2026-04-28 at 11 46 15 AM" src="https://github.com/user-attachments/assets/5376d0b4-4478-4cf8-ba21-5d573dbbf16b" />


## 🚀 Features

- **Add & Delete Cars** — Easily add new vehicles to inventory or remove sold/unlisted ones
- **Status Management** — Mark each car as `Available` or `Sold` with a single tap
- **Smart Search** — Search inventory by both car name and brand in real time
- **Filter by Availability** — Quickly filter cars to view only Available or Sold listings
- **Detailed Car Listings** — Add cars with rich details including:
  - Fuel Type (Petrol, Diesel, Electric, etc.) via dropdown
  - Gearbox Type (Manual, Automatic, etc.) via dropdown
  - Price, Brand, and more

## 🛠 Tech Stack

- **Language:** Swift
- **UI Framework:** SwiftUI
- **Architecture:** MVVM (Model-View-ViewModel)
- **Platform:** iOS 16+
- **Tools:** Xcode 15+

## 📂 Project Structure

```
carZone/
├── Models/
│   └── Car.swift               # Car data model
├── ViewModels/
│   └── CarViewModel.swift      # Business logic & state management
├── Views/
│   ├── CarListView.swift        # Main inventory list with search & filter
│   ├── CarDetailView.swift      # Detailed view of a single car
│   ├── AddCarView.swift         # Form to add a new car
│   └── CarCardView.swift        # Reusable car card UI component
└── ContentView.swift            # App entry point
```

## 📦 Installation

1. Clone the repository
   ```bash
   git clone https://github.com/keshavsaini2218/CarZone.git
   ```
2. Open `carZone.xcodeproj` in Xcode
3. Select a simulator or connected device
4. Press `⌘ + R` to build and run

## 🧑‍💻 Author

**Keshav Saini**
GitHub: [@keshavsaini2218](https://github.com/keshavsaini2218)

## 📄 License

This project is licensed under the MIT License.
