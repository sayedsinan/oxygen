import 'dart:ui';

import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool showSearchOverlay = false.obs;
  RxString? selectedPatient = RxString('');
  RxString? selectedDoctor = RxString('');
  RxString? selectedDate = RxString('');
  RxInt selectedDateIndex = 4.obs; // default to 23 FRI

  final List<Map<String, String>> dates = [
    {'day': 'MON', 'date': '19'},
    {'day': 'TUE', 'date': '20'},
    {'day': 'WED', 'date': '21'},
    {'day': 'THU', 'date': '22'},
    {'day': 'FRI', 'date': '23'},
    {'day': 'SAT', 'date': '24'},
    {'day': 'SUN', 'date': '25'},
  ];

  final List<Map<String, dynamic>> doctors = [
    {
      'name': 'Brooklyn Simmons',
      'specialty': 'Cardiology',
      'bookings': '12/80 Bookings',
      'timing': '08:00AM - 09:00AM | 04:00PM - 08:00PM',
      'color': const Color(0xFF1E3A8A),
      'initial': 'B',
    },
    {
      'name': 'Cameron Williamson',
      'specialty': 'Cardiology',
      'bookings': '12/80 Bookings',
      'timing': '08:00AM - 09:00AM',
      'color': const Color(0xFFF59E0B),
      'initial': 'C',
    },
    {
      'name': 'Devon Lane',
      'specialty': 'Cardiology',
      'bookings': 'Next: 20-11-2025',
      'timing': '',
      'color': const Color(0xFF8B5CF6),
      'initial': 'D',
      'hasNotification': true,
    },
    {
      'name': 'Robert Fox',
      'specialty': 'Cardiology',
      'bookings': '12/80 Bookings',
      'timing': '08:00AM - 09:00AM | 04:00PM - 08:00PM',
      'color': const Color(0xFFEF4444),
      'initial': 'R',
    },
  ];

  void toggleOverlay(bool show) => showSearchOverlay.value = show;

  void selectDoctor(String name) => selectedDoctor?.value = name;
  void selectDate(String date, int index) {
    selectedDate?.value = date;
    selectedDateIndex.value = index;
  }

  void clearSelections() {
    selectedDoctor?.value = '';
    selectedDate?.value = '';
    selectedPatient?.value = '';
  }
}
