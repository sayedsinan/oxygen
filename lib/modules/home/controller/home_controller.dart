import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:oxygen/data/repositories/doctor_repository.dart';
import 'package:oxygen/data/repositories/patient_repository.dart';

import 'package:oxygen/data/services/search_history_services.dart';

class HomeController extends GetxController {
  RxBool showSearchOverlay = false.obs;
  RxString selectedPatient = ''.obs;
  RxString selectedDoctor = ''.obs;
  RxString selectedDate = ''.obs;
  RxInt selectedDateIndex = 4.obs;
  RxBool isBooking = false.obs;
  
  RxString searchQuery = ''.obs;
  RxList filteredPatients = [].obs;
  RxList filteredDoctors = [].obs;
  RxList<Map<String, dynamic>> searchHistory = <Map<String, dynamic>>[].obs;
  
  final PatientRepository _patientRepo = PatientRepository();
  final DoctorRepository _doctorRepo = DoctorRepository();
  final SearchHistoryService _historyService = SearchHistoryService();
 

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
      'color': Color(0xFF1E3A8A),
      'initial': 'B',
    },
    {
      'name': 'Cameron Williamson',
      'specialty': 'Cardiology',
      'bookings': '12/80 Bookings',
      'timing': '08:00AM - 09:00AM',
      'color': Color(0xFFF59E0B),
      'initial': 'C',
    },
    {
      'name': 'Devon Lane',
      'specialty': 'Cardiology',
      'bookings': 'Next: 20-11-2025',
      'timing': '',
      'color': Color(0xFF8B5CF6),
      'initial': 'D',
      'hasNotification': true,
    },
    {
      'name': 'Robert Fox',
      'specialty': 'Cardiology',
      'bookings': '12/80 Bookings',
      'timing': '08:00AM - 09:00AM | 04:00PM - 08:00PM',
      'color': Color(0xFFEF4444),
      'initial': 'R',
    },
  ];

  @override
  void onInit() {
    super.onInit();
    _loadSearchHistory();
  }

  void _loadSearchHistory() {
    searchHistory.value = _historyService.getHistory();
  }

  void toggleOverlay(bool show) {
    showSearchOverlay.value = show;
    if (!show) {
      searchQuery.value = '';
      filteredPatients.clear();
      filteredDoctors.clear();
    }
  }

  void selectDoctor(String name) {
    selectedDoctor.value = name;
    _historyService.addToHistory(name, 'doctor');
    _loadSearchHistory();
  }
  
  void selectDate(String date, int index) {
    selectedDate.value = date;
    selectedDateIndex.value = index;
  }

  void selectPatient(String name) {
    selectedPatient.value = name;
    _historyService.addToHistory(name, 'patient');
    _loadSearchHistory();
  }

  void clearSelections() {
    selectedDoctor.value = '';
    selectedDate.value = '';
    selectedPatient.value = '';
    selectedDateIndex.value = 4;
  }
  
  void searchItems(String query) {
    searchQuery.value = query;
    
    if (query.isEmpty) {
      filteredPatients.clear();
      filteredDoctors.clear();
      return;
    }
    
    final lowercaseQuery = query.toLowerCase();
    
    // Search patients
    filteredPatients.value = _patientRepo
        .getAllPatients()
        .where((patient) =>
            patient.name.toLowerCase().contains(lowercaseQuery) ||
            patient.phone.contains(query))
        .toList();
    
    // Search doctors
    filteredDoctors.value = _doctorRepo
        .getAllDoctors()
        .where((doctor) =>
            doctor.name.toLowerCase().contains(lowercaseQuery) ||
            doctor.specialty.toLowerCase().contains(lowercaseQuery))
        .toList();
  }

  /// Remove item from search history
  Future<void> removeFromHistory(String query, String type) async {
    await _historyService.removeFromHistory(query, type);
    _loadSearchHistory();
  }

  /// Clear all search history
  Future<void> clearAllHistory() async {
    await _historyService.clearHistory();
    _loadSearchHistory();
  }

  
}