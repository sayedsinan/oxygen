import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';

class GenderSelectionSection extends StatelessWidget {
  final HomeController controller;

  const GenderSelectionSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            Expanded(
              child: GenderOptionButton(
                icon: Icons.male,
                label: 'Male',
                value: 'male',
                selectedGender: controller.selectedGender.value,
                onTap: () => controller.selectedGender.value = 'male',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GenderOptionButton(
                icon: Icons.female,
                label: 'Female',
                value: 'female',
                selectedGender: controller.selectedGender.value,
                onTap: () => controller.selectedGender.value = 'female',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GenderOptionButton(
                icon: Icons.transgender,
                label: 'Other',
                value: 'other',
                selectedGender: controller.selectedGender.value,
                onTap: () => controller.selectedGender.value = 'other',
              ),
            ),
          ],
        ));
  }
}

class GenderOptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String selectedGender;
  final VoidCallback onTap;

  const GenderOptionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.selectedGender,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedGender == value;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? Colors.black : Colors.grey[600],
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? Colors.black : Colors.grey[700],
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}