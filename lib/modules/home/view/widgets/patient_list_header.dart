import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';

class PatientListHeader extends StatelessWidget {
  final HomeController controller;

  const PatientListHeader({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Back button aligned to left
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              controller.isPhoneVerified.value = false;
              controller.phoneController.clear();
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),

        const SizedBox(height: 8),

        // Centered heading and subtitle
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Patients Linked to This Number',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2C3E50),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              'Select a patient or add a new one.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
