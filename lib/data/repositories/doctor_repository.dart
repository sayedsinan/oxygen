import 'package:flutter/material.dart';
import 'package:oxygen/data/model/doctor_model.dart';

class DoctorRepository {
  final List<Doctor> _doctors = [
    Doctor(
        name: 'Brooklyn Simmons',
        specialty: 'Cardiology',
        bookings: '12/80 Bookings',
        timing: '08:00AM - 09:00AM | 04:00PM - 08:00PM',
        color: const Color(0xFF1E3A8A),
        initial: 'B'),
    Doctor(
        name: 'Cameron Williamson',
        specialty: 'Cardiology',
        bookings: '12/80 Bookings',
        timing: '08:00AM - 09:00AM',
        color: const Color(0xFFF59E0B),
        initial: 'C'),
    Doctor(
        name: 'Devon Lane',
        specialty: 'Cardiology',
        bookings: 'Next: 20-11-2025',
        timing: '',
        color: const Color(0xFF8B5CF6),
        initial: 'D',
        hasNotification: true),
    Doctor(
        name: 'Robert Fox',
        specialty: 'Cardiology',
        bookings: '12/80 Bookings',
        timing: '08:00AM - 09:00AM | 04:00PM - 08:00PM',
        color: const Color(0xFFEF4444),
        initial: 'R'),
  ];

  List<Doctor> getAllDoctors() => _doctors;

  Doctor? getDoctorByName(String name) =>
      _doctors.firstWhere((d) => d.name == name, orElse: () => Doctor(
          name: '', specialty: '', bookings: '', timing: '', color: Colors.transparent, initial: ''));
}
