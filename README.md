# Sikada - Smart Parking Solution

A comprehensive Flutter-based smart parking application that revolutionizes urban parking management through real-time monitoring, intelligent space detection, and seamless user experience.

## 🚗 Project Overview

Sikada is an innovative smart parking solution designed to address the growing challenges of urban parking. The application leverages modern technologies including GPS tracking, real-time data processing, and intuitive user interfaces to provide an efficient parking management system.

## ✨ Key Features

### 🎯 Core Functionality
- **Real-time Parking Availability**: Live updates on parking space availability
- **GPS-based Navigation**: Precise location tracking and navigation to available spots
- **Interactive Maps**: Flutter Map integration for seamless map experience
- **Smart Space Detection**: AI-powered parking space identification
- **Multi-platform Support**: Android, iOS, Web, Windows, macOS, and Linux

### 📱 User Experience
- **Onboarding Flow**: Smooth user introduction with flutter_onboarding_slider
- **Modern UI/UX**: Material Design with custom animations
- **Speed Dial Actions**: Quick access to frequently used features
- **Animated Bottom Navigation**: Smooth transitions between app sections
- **Secure Authentication**: Flutter Secure Storage for user data protection

### 🔧 Technical Features
- **State Management**: GetX for efficient state management
- **API Integration**: HTTP and Dio for robust API communication
- **Connectivity Monitoring**: Real-time network status tracking
- **Data Persistence**: SharedPreferences and GetStorage for local data
- **Loading Animations**: Engaging user feedback during operations

## 🏗️ Project Structure

### 📁 lib/ Directory Structure

`
Folder PATH listing

lib/
├── main.dart                          # App entry point
├── test.dart                          # Test utilities
│
├── config/                           # App configuration
│   ├── colors.dart
│   ├── dependencies.dart
│   ├── fonts.dart
│   └── urls.dart
│
├── features/                         # Feature modules
│   ├── ai/
│   │   └── ai_view.dart
│   │
│   ├── auth/                        # Authentication
│   │   ├── authcontroller.dart
│   │   ├── user_model.dart
│   │   └── authpages/
│   │       ├── login.dart           # Key auth screens
│   │       ├── signup.dart
│   │       └── verification.dart
│   │
│   ├── map/                         # Map functionality
│   │   ├── map_view.dart
│   │   ├── map_service.dart
│   │   └── locations.dart
│   │
│   ├── payment/                     # Payment system
│   ├── reservation/                 # Parking reservations
│   │   └── my_reservations.dart
│   │
│   └── sessions/                    # Parking sessions
│       ├── session_page.dart
│       └── car/
│           └── car.dart
│
├── pages/                           # Main app pages
│   ├── root_page.dart               # Navigation root
│   ├── splash_screen.dart           # App splash
│   │
│   ├── home/                        # Home screen
│   │   └── home_page.dart
│   │
│   └── profile/                     # User profile
│       └── profile_view.dart
│
└── utils/                           # Utilities
    ├── components.dart              # Reusable components
    ├── dialogs.dart
    └── app_bar.dart

`

## 🛠️ Technology Stack

### Frontend Framework
- **Flutter 3.8.1+**: Cross-platform mobile and desktop development
- **Dart**: Programming language

### State Management
- **GetX**: Reactive state management and dependency injection
- **GetStorage**: Local storage solution
- **SharedPreferences**: Platform-specific preferences storage
- **Flutter Secure Storage**: Secure data storage

### Maps & Location
- **Flutter Map**: Interactive map widget
- **LatLong2**: Geographic coordinate handling
- **Geolocator**: GPS location services

### Networking & APIs
- **HTTP**: Basic HTTP client
- **Dio**: Advanced HTTP client with interceptors
- **Connectivity Plus**: Network connectivity monitoring

### UI/UX Libraries
- **Google Fonts**: Custom typography
- **Animated Bottom Navigation Bar**: Smooth navigation transitions
- **Flutter Speed Dial**: Quick action buttons
- **Loading Animation Widget**: User feedback animations
- **Flutter Onboarding Slider**: User introduction flow

### Development Tools
- **Flutter Lints**: Code quality and style enforcement
- **Icons Launcher**: App icon generation
- **Flutter Native Splash**: Splash screen configuration

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.8.1 or higher
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   `ash
   git clone <repository-url>
   cd sikada
   `

2. **Install dependencies**
   `ash
   flutter pub get
   `

3. **Configure platform-specific settings**
   - Update API endpoints in lib/config/urls.dart
   - Configure map API keys
   - Set up platform-specific permissions

4. **Run the application**
   `ash
   flutter run
   `

### Platform-Specific Setup

#### Android
- Minimum SDK version: 21
- Target SDK version: 34
- Location permissions required

#### iOS
- Minimum iOS version: 11.0
- Location permissions required
- Background location updates



## 📱 Features Breakdown

### 1. User Authentication
- Secure login/registration system
- Social authentication (Google, Apple)
- Password recovery
- Session management

### 2. Parking Discovery
- Real-time parking space availability
- Interactive map with parking locations
- Search and filter options
- Distance-based recommendations

### 3. Navigation & Directions
- GPS-based navigation to parking spots
- Turn-by-turn directions
- Real-time traffic updates
- Alternative route suggestions

### 4. Booking Management
- Reserve parking spaces
- Booking history
- Cancellation policies
- Payment integration

### 5. User Profile
- Personal information management
- Payment methods
- Vehicle information
- Preferences and settings

### 6. Notifications
- Booking confirmations
- Reminder alerts
- Parking availability updates
- System notifications

