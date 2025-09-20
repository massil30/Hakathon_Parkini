# Sikada - Smart Parking Solution

A comprehensive Flutter-based smart parking application that revolutionizes urban parking management through real-time monitoring, intelligent space detection, and seamless user experience.

## 🚗 Project Overview

Sikada is an innovative smart parking solution designed to address the growing challenges of urban parking. The application leverages modern technologies including GPS tracking, real-time data processing, and intuitive user interfaces to provide an efficient parking management system.

![Ai](https://github.com/user-attachments/assets/33900cdc-31f5-434b-8447-692413a4fc81)
![Login](https://github.com/user-attachments/assets/c2813efa-b8a4-47eb-9f9e-4022b7a904e1)
![Profile](https:/![Select Spot](https://github.com/user-attachments/assets/52c43efb-34a5-41ef-a059-55253a08f17c)
/github.com/user-attachments/assets/9530d6e7-54f7-4c32-b8c0-19351478b04a)

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


Folder PATH listing

# Flutter Project Structure

```
lib/
├── main.dart
├── test.dart
│
├── config/
│   ├── colors.dart
│   ├── dependencies.dart
│   ├── fonts.dart
│   └── urls.dart
│
├── features/
│   ├── ai/
│   │   ├── ai_recommendation.dart
│   │   └── ai_view.dart
│   │
│   ├── auth/
│   │   ├── authcontroller.dart
│   │   ├── user_model.dart
│   │   └── authpages/
│   │       ├── auth_components.dart
│   │       ├── forget_password.dart
│   │       ├── login.dart
│   │       ├── reset_password.dart
│   │       ├── signup.dart
│   │       └── verification.dart
│   │
│   ├── details/
│   │   ├── parking_details.dart
│   │   └── reservation_details.dart
│   │
│   ├── legalize/
│   │   ├── legalization_review.dart
│   │   └── legalize.dart
│   │
│   ├── map/
│   │   ├── bottom_sheet.dart
│   │   ├── locations.dart
│   │   ├── map_service.dart
│   │   ├── map_view.dart
│   │   └── parking_details.dart
│   │
│   ├── payment/
│   │
│   ├── report/
│   │   ├── my_reports.dart
│   │   ├── personal_form.dart
│   │   ├── report_review.dart
│   │   └── submit_report.dart
│   │
│   ├── reservation/
│   │   ├── my_reservations.dart
│   │   ├── parking.dart
│   │   └── reserved.dart
│   │
│   └── sessions/
│       ├── session_page.dart
│       ├── session_vm.dart
│       ├── car/
│       │   ├── car.dart
│       │   └── spot.dart
│       └── first/
│           ├── review_page.dart
│           └── selection.dart
│
├── pages/
│   ├── introduction.dart
│   ├── root_page.dart
│   ├── splash_screen.dart
│   │
│   ├── home/
│   │   ├── home_page.dart
│   │   └── home_widget.dart
│   │
│   └── profile/
│       ├── profile_widget.dart
│       └── profile_view.dart
│
└── utils/
    ├── app_bar.dart
    ├── components.dart
    ├── dialogs.dart
    └── image_picker.dart
```

## Copy This Structure:

You can copy the code block above and paste it directly into your:
- **README.md** file
- **GitHub repository description**
- **Documentation files**
- **Project wiki**

The structure will display cleanly with proper:
- ✅ Tree formatting
- ✅ Clean indentation
- ✅ Professional appearance
- ✅ Easy to read hierarchy



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

