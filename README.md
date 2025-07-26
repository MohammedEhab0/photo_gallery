# 📸 Photo Gallery App

A Flutter application that displays a curated list of photos using the [Pexels API](https://www.pexels.com/api/). It uses **Clean Architecture**, **Hive for local caching**, and **Connectivity Plus** to detect and handle network states.

---

## 🚀 Features

- Fetch photos from the Pexels API.
- Offline support using Hive for local caching.
- Light/Dark mode UI support.
- Network status indicator (online/offline).
- Loading and error states with appropriate UI feedback.
- Clean Architecture structure using `injectable`, `get_it`, and separation of layers.

---

## 📷 Screenshots

| State | Light Mode | Dark Mode |
|------|-------------|-----------|
| **Photo List (Online)** | ![Online Light](screenshots/online_light.png) | ![Online Dark](screenshots/online_dark.png) |
| **Photo List (Offline / Cached)** | ![Offline Light](screenshots/offline_light.png) | ![Offline Dark](screenshots/offline_dark.png) |
| **Loading State** | ![Loading](screenshots/loading.png) |  |
| **Error State** | ![Error](screenshots/error.png) | |
| **Network Status Banner** | ![Offline Banner](screenshots/offline_banner.png) | ![Online Banner](screenshots/online_banner.png) |

> 💡 Make sure your `screenshots/` folder contains the images above using the correct names.

---
## 🧠 Clean Architecture

The app follows the Clean Architecture principles:
Presentation Layer (UI)
└── Uses ViewModels & Cubits to manage state
Domain Layer
└── Interfaces (Repositories) define business logic
Data Layer
└── Implements Repositories, manages remote (API) and local (Hive) data sources
---

### ✅ Technologies Used:

- `flutter_bloc` & `provider` for state management
- `injectable` & `get_it` for dependency injection
- `hive_flutter` for local persistence
- `connectivity_plus` for detecting network status
- `http` for API calls
- `build_runner` & `freezed` for code generation

---

# 📬 API Access
This app uses the Pexels API. Make sure to include your API key in your remote data source.

---

# Clone the project
git clone https://github.com/MohammedEhab0/photo_gallery.git
cd photo_gallery

---

# Install dependencies
flutter pub get

# Generate *.g.dart and dependency injection files
flutter pub run build_runner build --delete-conflicting-outputs

# Run the app
flutter run

---

👨‍💻 Author
Mohammed Ehab ElSherbiny
GitHub | LinkedIn
https://github.com/MohammedEhab0/photo_gallery.git
https://www.linkedin.com/in/mohammed-ehab-055297255/