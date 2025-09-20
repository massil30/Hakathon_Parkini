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
lib/
├── main.dart                           # Application entry point
├── test.dart                          # Test utilities and mock data
│
├── config/                            # Configuration files
│   ├── colors.dart                    # App color scheme and theming
│   ├── dependencies.dart              # Dependency injection setup
│   ├── fonts.dart                     # Font configurations
│   └── urls.dart                      # API endpoints and URLs
│
├── features/                          # Feature-based modules
│   ├── Ai/                           # AI-powered features
│   │   ├── ai_recommendation.dart    # AI parking recommendations
│   │   └── ai_view.dart              # AI recommendation UI
│   │
│   ├── auth/                         # Authentication system
│   │   ├── authcontroller.dart       # Authentication logic controller
│   │   ├── user_model.dart           # User data model
│   │   └── authpages/                # Authentication screens
│   │       ├── auth_components.dart  # Reusable auth components
│   │       ├── ForgetPassword.dart   # Password recovery screen
│   │       ├── login.dart            # Login screen
│   │       ├── ResetPassword.dart    # Password reset screen
│   │       ├── SignUp.dart           # Registration screen
│   │       └── verification.dart     # Email/Phone verification
│   │
│   ├── details/                      # Parking details management
│   │   ├── parkingdetails.dart       # Parking spot details view
│   │   └── reservationdetails.dart   # Reservation details view
│   │
│   ├── legalize/                     # Legal compliance features
│   │   ├── legalizationreview.dart   # Legal review process
│   │   └── legalize.dart             # Legalization main screen
│   │
│   ├── map/                          # Map functionality
│   │   ├── bottom_sheet.dart         # Map bottom sheet component
│   │   ├── locations.dart            # Location data models
│   │   ├── map_service.dart          # Map service logic
│   │   ├── map_view.dart             # Main map interface
│   │   └── parkingdetails.dart       # Parking details on map
│   │
│   ├── payment/                      # Payment processing
│   │   └── (payment related files)
│   │
│   ├── report/                       # Reporting system
│   │   ├── myreports.dart            # User's reports list
│   │   ├── personalform.dart         # Personal report form
│   │   ├── reportreview.dart         # Report review screen
│   │   └── submitreport.dart         # Report submission
│   │
│   ├── reservation/                  # Parking reservations
│   │   ├── myReservations.dart       # User's reservations list
│   │   ├── parking.dart              # Parking selection
│   │   └── reserved.dart             # Reserved parking view
│   │
│   └── sessions/                     # Parking sessions
│       ├── sessionpage.dart          # Session management page
│       ├── session_vm.dart           # Session view model
│       ├── car/                      # Car management
│       │   ├── car.dart              # Car registration/management
│       │   └── spot.dart             # Parking spot selection
│       └── first/                    # First-time user flow
│           ├── reviewPage.dart       # Review and confirmation
│           └── selection.dart        # Initial selection screen
│
├── pages/                            # Main application pages
│   ├── Home/                         # Home screen components
│   │   ├── homepage.dart             # Main home screen
│   │   └── homewidget.dart           # Home screen widgets
│   │
│   ├── profile/                      # User profile management
│   │   ├── profilerwidget.dart       # Profile widgets
│   │   └── profileview.dart          # Profile view screen
│   │
│   ├── introduction.dart             # App introduction/onboarding
│   ├── rootpage.dart                 # Root navigation page
│   └── splashscreen.dart             # App splash screen
│
└── utils/                            # Utility functions and components
    ├── appbar.dart                   # Custom app bar components
    ├── components.dart               # Reusable UI components
    ├── dialogs.dart                  # Custom dialog components
    └── imagepicker.dart              # Image picker utilities
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

#### Web
- Modern browser support
- HTTPS required for location services

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

## 🔧 Configuration

### Environment Variables
Create a .env file in the root directory:
`
API_BASE_URL=https://your-api-endpoint.com
MAP_API_KEY=your_map_api_key
GOOGLE_MAPS_API_KEY=your_google_maps_key
`

### API Integration
The app integrates with backend services for:
- User authentication
- Parking data management
- Real-time updates
- Payment processing

## 🧪 Testing

Run tests using:
`ash
# Unit tests
flutter test

# Integration tests
flutter test integration_test/

# Coverage report
flutter test --coverage
`

## 📦 Building for Production

### Android
`ash
flutter build apk --release
flutter build appbundle --release
`

### iOS
`ash
flutter build ios --release
`

### Web
`ash
flutter build web --release
`

### Desktop
`ash
flutter build windows --release
flutter build macos --release
flutter build linux --release
`

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 Team

- **Project Lead**: [Your Name]
- **Backend Developer**: [Team Member]
- **UI/UX Designer**: [Team Member]
- **Mobile Developer**: [Team Member]

## 📞 Support

For support and questions:
- Email: support@sikada.com
- Documentation: [Link to detailed docs]
- Issues: [GitHub Issues Link]

## 🔮 Future Roadmap

- [ ] AI-powered parking prediction
- [ ] Electric vehicle charging integration
- [ ] Car wash booking
- [ ] Valet parking services
- [ ] Multi-language support
- [ ] Advanced analytics dashboard
- [ ] IoT sensor integration
- [ ] Blockchain-based payments

---

**Sikada** - Revolutionizing urban parking, one space at a time. 🚗✨
