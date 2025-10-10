import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String specialty;
  final String bookings;
  final String timing;
  final Color color;
  final String initial;
  final bool hasNotification;

  Doctor({
    required this.name,
    required this.specialty,
    required this.bookings,
    required this.timing,
    required this.color,
    required this.initial,
    this.hasNotification = false,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialty: json['specialty'],
      bookings: json['bookings'],
      timing: json['timing'],
      color: json['color'],
      initial: json['initial'],
      hasNotification: json['hasNotification'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'specialty': specialty,
        'bookings': bookings,
        'timing': timing,
        'color': color,
        'initial': initial,
        'hasNotification': hasNotification,
      };
}
