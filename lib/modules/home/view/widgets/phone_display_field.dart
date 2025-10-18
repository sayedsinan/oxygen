import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';

class PhoneDisplayField extends StatelessWidget {
  final HomeController controller;

  const PhoneDisplayField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            controller.phoneController.text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2C3E50),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.edit_outlined),
          iconSize: 20,
          color: Colors.grey[600],
          onPressed: () {
            controller.showNewPatientForm.value = false;
            controller.isPhoneVerified.value = false;
          },
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }
}
