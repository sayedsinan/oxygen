🩺 Oxzygen 
A fully responsive Flutter web & desktop app built for the Machine Test: Patient Search & Appointment Booking UI challenge.
This project replicates the provided Figma design and adds functionality for searching, filtering, and booking patient/doctor appointments — powered by local data, GetX state management, and local storage for recent searches.

🚀 Features Implemented
🏠 Home Page

Modern sidebar layout with navigation items: Home, Appointments, Doctors, Patients, Bills

Top-right user info section displaying name & role

Search bar with intelligent filtering supporting:

Doctor name

Patient name

Department

Date (via calendar picker)

Dropdown suggestions from local JSON data

Search chips for selected filters

Dashboard cards showing:

Booked

Check-in

Completed

Today’s Appointments section listing patients dynamically

📅 Booking Page

Displays selected Doctor/Patient details

Shows available time slots from local data

Simple “Confirm Booking” button

⚙️ Additional Features

✅ Fully responsive (mobile, tablet, desktop)
✅ Local storage (GetStorage) for saving & restoring recent searches
✅ Calendar picker for date-based search
✅ Smooth dropdown animations for better UX
✅ Clean & scalable GetX architecture

🧩 Architecture Overview
lib/
├── main.dart
├── app/
│   ├── routes/
│   │   ├── app_pages.dart
│   │   └── app_routes.dart
│   └── theme/
│       ├── app_colors.dart
│       ├── app_text_styles.dart
│       └── app_theme.dart
├── data/
│   ├── models/
│   │   ├── doctor_model.dart
│   │   └── patient_model.dart
│   ├── repositories/
│   │   ├── doctor_repository.dart
│   │   └── patient_repository.dart
│   └── services/
│       └── search_history_service.dart
├── modules/
│   ├── home/
│   │   ├── controllers/
│   │   │   └── home_controller.dart
│   │   ├── views/
│   │   │   ├── home_view.dart
│   │   │   └── widgets/
│   │   │       ├── search_field_bubble.dart
│   │   │       ├── sidebar_menu.dart
│   │   │       └── dashboard_widgets.dart

🧠 Stack & Libraries

State Management: GetX

Local Storage: GetStorage

UI Scaling: Flutter ScreenUtil

Date Formatting: intl

Responsive Design: MediaQuery + custom breakpoints

📂 Static Data Samples
👩‍⚕️ Doctors
const doctors = [
  { "id": 1, "name": "Brooklyn Simmons", "department": "Cardiology", "bookings": 12, "totalSlots": 80, "available": ["08:00AM - 09:00AM", "04:00PM - 08:00PM"] },
  { "id": 2, "name": "Cameron Williamson", "department": "Cardiology", "bookings": 12, "totalSlots": 80, "available": ["08:00AM - 09:00AM"] },
  { "id": 3, "name": "Devon Lane", "department": "Cardiology", "bookings": 10, "totalSlots": 80, "nextAvailable": "20-11-2025" },
  { "id": 4, "name": "Robert Fox", "department": "Cardiology", "bookings": 15, "totalSlots": 80, "available": ["09:00AM - 10:00AM", "05:00PM - 06:00PM"] }
];

🧑‍🤝‍🧑 Patients
const patients = [
  { "id": 1, "name": "Eleanor Pena", "gender": "Female", "phone": "9876543210" },
  { "id": 2, "name": "Wade Warren", "gender": "Male", "phone": "8765432109" },
  { "id": 3, "name": "Courtney Henry", "gender": "Female", "phone": "7654321098" }
];

⚙️ Setup Instructions

Clone the repository

git clone https://github.com/sayedsinan/oxygen
cd oxygen


Install dependencies

flutter pub get


Run the app

flutter run -d chrome


or

flutter run

🧾 Bonus Features Implemented

✅ Local search history (using GetStorage)
✅ Animated dropdown transitions
✅ Adaptive sidebar → bottom navigation for mobile view
✅ Optimized UI scaling using flutter_screenutil

💡 Assumptions

No backend API integration (local static JSON only)

Booking confirmation does not persist (UI only)

User info (name & role) is hardcoded for demo purposes

🧑‍💻 Author

Sinan Jifry
📧 [sayedsinanjifry7@gmail.com]
🌐 Flutter Developer | TypeScript Backend Enthusiast