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
  final isBookingSuccessful = false.obs;

  RxString searchQuery = ''.obs;
  RxList filteredPatients = [].obs;
  RxList filteredDoctors = [].obs;
  RxList<Map<String, dynamic>> searchHistory = <Map<String, dynamic>>[].obs;

  final PatientRepository _patientRepo = PatientRepository();
  final DoctorRepository _doctorRepo = DoctorRepository();
  final SearchHistoryService _historyService = SearchHistoryService();

  // Calendar
  final showCalendar = false.obs;

  // Slot selection properties
  var selectedPeriod = 'morning'.obs;
  var selectedSlot = ''.obs;

  // Sample slots data - Replace with your actual data source/API
  final RxList<Map<String, dynamic>> _morningSlots = <Map<String, dynamic>>[
    {'time': '09:00 AM', 'status': 'available', 'spotsLeft': null},
    {'time': '09:30 AM', 'status': 'limited', 'spotsLeft': 1},
    {'time': '10:00 AM', 'status': 'booked', 'spotsLeft': null},
    {'time': '10:30 AM', 'status': 'available', 'spotsLeft': null},
    {'time': '11:00 AM', 'status': 'available', 'spotsLeft': null},
    {'time': '11:30 AM', 'status': 'available', 'spotsLeft': null},
  ].obs;

  final RxList<Map<String, dynamic>> _afternoonSlots = <Map<String, dynamic>>[
    {'time': '12:00 PM', 'status': 'available', 'spotsLeft': null},
    {'time': '12:30 PM', 'status': 'available', 'spotsLeft': null},
    {'time': '01:00 PM', 'status': 'limited', 'spotsLeft': 2},
    {'time': '01:30 PM', 'status': 'available', 'spotsLeft': null},
    {'time': '02:00 PM', 'status': 'booked', 'spotsLeft': null},
    {'time': '02:30 PM', 'status': 'available', 'spotsLeft': null},
    {'time': '03:00 PM', 'status': 'available', 'spotsLeft': null},
    {'time': '03:30 PM', 'status': 'available', 'spotsLeft': null},
    {'time': '04:00 PM', 'status': 'limited', 'spotsLeft': 3},
  ].obs;

  // Computed property for available slots based on selected period
  List<Map<String, dynamic>> get availableSlots {
    return selectedPeriod.value == 'morning'
        ? _morningSlots.toList()
        : _afternoonSlots.toList();
  }

  // Registration form observables
  final isPhoneVerified = false.obs;
  final showRegisterForm = false.obs;
  final showNewPatientForm = false.obs;
  final selectedGender = 'male'.obs;
  final showAdditionalDetails = false.obs;
  final selectedBloodGroup = ''.obs;
  final selectedRelationship = ''.obs;

  // Registration success observable
  final isRegistrationSuccess = false.obs;

  // Text controllers
  final phoneController = TextEditingController();
  final patientNameController = TextEditingController();
  final patientAgeController = TextEditingController();
  final addressController = TextEditingController();
  final pincodeController = TextEditingController();
  final emergencyNameController = TextEditingController();
  final emergencyMobileController = TextEditingController();

  void toggleCalendarView() {
    showCalendar.value = !showCalendar.value;
  }
  void updatePatientStatus(String patientId, String newStatus) {
  // Update your patient data here
  final patient = filteredPatients.firstWhere((p) => p.id == patientId);
  patient.status = newStatus;
  // Refresh UI
  update();
}

  // Slot selection methods
  void selectPeriod(String period) {
    selectedPeriod.value = period;
    selectedSlot.value = ''; // Reset slot selection when period changes
  }

  void selectSlot(String time) {
    selectedSlot.value = time;
    print(
      'Selected slot: $time on date: $selectedDate for doctor: $selectedDoctor',
    );
  }

  // Method to load slots from API or database
  Future<void> loadSlotsForDate(String date) async {
    // TODO: Implement your API call to fetch slots for the selected date and doctor
    // Example:
    // try {
    //   final response = await apiService.getSlots(
    //     doctorId: selectedDoctor.value,
    //     date: date,
    //   );
    //   _morningSlots.value = response['morning'];
    //   _afternoonSlots.value = response['afternoon'];
    // } catch (e) {
    //   print('Error loading slots: $e');
    //   Get.snackbar('Error', 'Failed to load available slots');
    // }

    print('Loading slots for date: $date, doctor: $selectedDoctor');
  }

  // Method to confirm booking
  void confirmBooking() {
    if (selectedDate.value.isEmpty) {
      Get.snackbar('Error', 'Please select a date');
      return;
    }

    if (selectedSlot.value.isEmpty) {
      Get.snackbar('Error', 'Please select a time slot');
      return;
    }

    if (selectedDoctor.value.isEmpty) {
      Get.snackbar('Error', 'Please select a doctor');
      return;
    }

    if (selectedPatient.value.isEmpty) {
      Get.snackbar('Error', 'Please select a patient');
      return;
    }

    // TODO: Implement booking confirmation logic with API call
    print('Booking Details:');
    print('Patient: $selectedPatient');
    print('Doctor: $selectedDoctor');
    print('Date: $selectedDate');
    print('Time: $selectedSlot');

    isBooking.value = true;

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      isBooking.value = false;
      Get.snackbar(
        'Success',
        'Appointment booked successfully!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      clearSelections();
    });
  }

  // Phone verification
  void verifyPhoneNumber() {
    if (phoneController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter a phone number');
      return;
    }
    isPhoneVerified.value = true;
  }

  // Show new patient registration form
  void registerNewPatientWithNumber() {
    print('Register new patient with: ${phoneController.text}');
    showNewPatientForm.value = true;
  }

  // Clear new patient form
  void clearNewPatientForm() {
    patientNameController.clear();
    patientAgeController.clear();
    selectedGender.value = 'male';
    selectedBloodGroup.value = '';
    selectedRelationship.value = '';
    addressController.clear();
    pincodeController.clear();
    emergencyNameController.clear();
    emergencyMobileController.clear();
    showAdditionalDetails.value = false;
  }

  // Register new patient
  void registerPatient() {
    if (patientNameController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter patient name');
      return;
    }

    if (patientAgeController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter patient age');
      return;
    }

    // TODO: Add your API call here to register the patient
    print('Registering patient:');
    print('Name: ${patientNameController.text}');
    print('Age: ${patientAgeController.text}');
    print('Gender: ${selectedGender.value}');
    print('Phone: ${phoneController.text}');

    if (showAdditionalDetails.value) {
      print('Blood Group: ${selectedBloodGroup.value}');
      print('Address: ${addressController.text}');
      print('Pincode: ${pincodeController.text}');
      print('Emergency Contact: ${emergencyNameController.text}');
      print('Emergency Mobile: ${emergencyMobileController.text}');
      print('Relationship: ${selectedRelationship.value}');
    }

    // Show success view instead of snackbar
    isRegistrationSuccess.value = true;
  }

  // When user exits from success view
  void exitToMainView() {
    isRegistrationSuccess.value = false;
    clearNewPatientForm();
    clearRegistrationForm();
    // TODO: Navigate to dashboard if needed
  }

  // When user wants to book immediately after registration
  void bookNowAfterRegistration() {
    isRegistrationSuccess.value = false;
    clearNewPatientForm();
    clearRegistrationForm();
    // TODO: Navigate to booking flow with the registered patient
    print('Navigating to booking with patient: ${patientNameController.text}');
  }

  // Clear registration form
  void clearRegistrationForm() {
    phoneController.clear();
    isPhoneVerified.value = false;
    showRegisterForm.value = false;
    showNewPatientForm.value = false;
    isRegistrationSuccess.value = false;
    clearNewPatientForm();
  }

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
      "nextToken":"9:30 AM"
    },
    {
      'name': 'Cameron Williamson',
      'specialty': 'Cardiology',
      'bookings': '12/80 Bookings',
      'timing': '08:00AM - 09:00AM',
      'color': Color(0xFFF59E0B),
      'initial': 'C',
      
      "nextToken":"9:30 AM"
    },
    {
      'name': 'Devon Lane',
      'specialty': 'Cardiology',
      'bookings': 'Next: 20-11-2025',
      'timing': '',
      'color': Color(0xFF8B5CF6),
      'initial': 'D',
      'hasNotification': true,
      
      "nextToken":"8:30 AM"
    },
    {
      'name': 'Robert Fox',
      'specialty': 'Cardiology',
      'bookings': '12/80 Bookings',
      'timing': '08:00AM - 09:00AM | 04:00PM - 08:00PM',
      'color': Color(0xFFEF4444),
      'initial': 'R',
      
      "nextToken":"7:30 AM"
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
    selectedSlot.value = ''; // Reset slot selection when date changes
    loadSlotsForDate(date); // Load slots for the selected date
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
    selectedSlot.value = '';
    selectedPeriod.value = 'morning';
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
        .where(
          (patient) =>
              patient.name.toLowerCase().contains(lowercaseQuery) ||
              patient.phone.contains(query),
        )
        .toList();

    // Search doctors
    filteredDoctors.value = _doctorRepo
        .getAllDoctors()
        .where(
          (doctor) =>
              doctor.name.toLowerCase().contains(lowercaseQuery) ||
              doctor.specialty.toLowerCase().contains(lowercaseQuery),
        )
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

  @override
  void onClose() {
    phoneController.dispose();
    patientNameController.dispose();
    patientAgeController.dispose();
    addressController.dispose();
    pincodeController.dispose();
    emergencyNameController.dispose();
    emergencyMobileController.dispose();
    super.onClose();
  }
}
