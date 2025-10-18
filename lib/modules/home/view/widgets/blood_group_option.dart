import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';

class BloodGroupOption extends StatelessWidget {
  final HomeController controller;
  final String bloodGroup;

  const BloodGroupOption({
    super.key,
    required this.controller,
    required this.bloodGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSelected = controller.selectedBloodGroup.value == bloodGroup;
      return InkWell(
        onTap: () => controller.selectedBloodGroup.value = bloodGroup,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white, // Always white background
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? const Color(0xFF2C3E50) : const Color(0xFFE9ECEF), // Only border changes
              width: isSelected ? 2 : 1, // Optional: thicker border when selected
            ),
          ),
          child: Text(
            bloodGroup,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2C3E50), // Text color stays constant
            ),
          ),
        ),
      );
    });
  }
}