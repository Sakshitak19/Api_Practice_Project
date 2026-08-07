# 📱 API Practice Project (Flutter)

A Flutter application developed to practice REST API integration using the **DummyJSON API**. This project demonstrates user authentication, product listing, product details, cart management, and dynamic UI updates using **setState**, without using any state management library.

---

# ✨ Features

- 🔐 Login with POST API
- ✅ Login form validations using `TextEditingController`
- 🏠 Home Screen after successful login
- 📦 Product Listing using GET API
- 📜 Dynamic product list using `ListView.builder`
- 🔍 Product Detail Screen with data passing between screens
- 🛒 Add to Cart using POST API
- ➕➖ Dynamic quantity update on Product Detail page
- 🛍️ Cart Screen displaying products using GET API
- 📋 Dynamic cart list using `ListView.builder`
- ⚡ Real-time UI updates using `setState`

---

# 🛠️ Tech Stack

- Flutter
- Dart
- HTTP Package
- DummyJSON API
- StatefulWidget
- setState
- TextEditingController

---

# 📂 Project Structure

```
lib/
│── main.dart                 # Application entry point
│── login.dart                # Login Screen (POST API + Validation)
│── home.dart                 # Home Screen
│── product.dart              # Product Listing (GET API)
│── product_detail.dart       # Product Details, Data Passing & Add to Cart (POST API)
│── cart.dart                 # Cart Screen (GET API)
│── profile.dart              # Profile Screen
│── footer.dart               # Bottom Navigation
```

# 🚀 How to Run

### Clone the repository

```bash
git clone https://github.com/your-username/API_Practice_Project.git
```

### Navigate to the project

```bash
cd API_Practice_Project
```

### Install dependencies

```bash
flutter pub get
```

### Run the application

```bash
flutter run
```

---

# 📱 Application Flow

```
Login Screen
        │
        ▼
   Home Screen
        │
        ▼
 Product Listing
 (GET Products API)
        │
        ▼
 Product Detail
 (Data Passing)
        │
        ▼
 Add to Cart
 (POST API)
        │
        ▼
   Cart Screen
 (GET Cart API)
```

---

# 📸 Screens Included

- Login
- Home
- Product List
- Product Detail
- Cart
- Profile

---
