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
├── main.dart                           # Application entry point
├── structure.txt                       # Project structure documentation
├── test.dart                          # Test utilities and mock data
│
├── config/                            # Configuration files
│   ├── colors.dart                    # App color scheme and theming
│   ├── dependencies.dart              # Dependency injection setup
│   ├── fonts.dart                     # Font configurations
│   └── urls.dart                      # API endpoints and URLs
│
├── features/                          # Feature-based modules (Clean Architecture)
│   ├── ai/                           # AI-powered features
│   │   ├── ai_recommendation.dart     # AI parking recommendation service
│   │   └── ai_view.dart              # AI recommendation UI
│   │
│   ├── auth/                         # Authentication system
│   │   ├── authcontroller.dart       # Authentication logic controller
│   │   ├── user_model.dart           # User data model
│   │   └── authpages/                # Authentication screens
│   │       ├── auth_components.dart  # Reusable auth components
│   │       ├── forget_password.dart  # Password recovery screen
│   │       ├── login.dart            # Login screen
│   │       ├── reset_password.dart   # Password reset screen
│   │       ├── signup.dart           # Registration screen
│   │       └── verification.dart     # Email/Phone verification
│   │
│   ├── details/                      # Parking details management
│   │   ├── parking_details.dart      # Parking spot details view
│   │   └── reservation_details.dart  # Reservation details view
│   │
│   ├── legalize/                     # Legal compliance features
│   │   ├── legalization_review.dart  # Legal review process
│   │   └── legalize.dart             # Legalization main screen
│   │
│   ├── map/                          # Map functionality
│   │   ├── bottom_sheet.dart         # Map bottom sheet component
│   │   ├── locations.dart            # Location data models
│   │   ├── map_service.dart          # Map service logic
│   │   ├── map_view.dart             # Main map interface
│   │   └── parking_details.dart      # Parking details on map
│   │
│   ├── payment/                      # Payment processing
│   │   └── (payment implementation files)
│   │
│   ├── report/                       # Reporting system
│   │   ├── my_reports.dart           # User's reports list
│   │   ├── personal_form.dart        # Personal report form
│   │   ├── report_review.dart        # Report review screen
│   │   └── submit_report.dart        # Report submission
│   │
│   ├── reservation/                  # Parking reservations
│   │   ├── my_reservations.dart      # User's reservations list
│   │   ├── parking.dart              # Parking selection
│   │   └── reserved.dart             # Reserved parking view
│   │
│   └── sessions/                     # Parking sessions
│       ├── session_page.dart         # Session management page
│       ├── session_vm.dart           # Session view model
│       ├── car/                      # Car management
│       │   ├── car.dart              # Car registration/management
│       │   └── spot.dart             # Parking spot selection
│       └── first/                    # First-time user flow
│           ├── review_page.dart      # Review and confirmation
│           └── selection.dart        # Initial selection screen
│
├── pages/                            # Main application pages
│   ├── introduction.dart             # App introduction/onboarding
│   ├── root_page.dart                # Root navigation page
│   ├── splash_screen.dart            # App splash screen
│   │
│   ├── home/                         # Home screen components
│   │   ├── home_page.dart            # Main home screen
│   │   └── home_widget.dart          # Home screen widgets
│   │
│   └── profile/                      # User profile management
│       ├── profile_widget.dart       # Profile widgets
│       └── profile_view.dart         # Profile view screen
│
└── utils/                            # Utility functions and components
    ├── app_bar.dart                  # Custom app bar components
    ├── components.dart               # Reusable UI components
    ├── dialogs.dart                  # Custom dialog components
    └── image_picker.dart             # Image picker utilities

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

