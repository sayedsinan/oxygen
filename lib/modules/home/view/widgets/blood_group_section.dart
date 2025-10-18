
import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:oxygen/modules/home/view/widgets/add_blood_group.dart';
import 'package:oxygen/modules/home/view/widgets/blood_group_option.dart';

class BloodGroupSection extends StatelessWidget {
  final HomeController controller;

  const BloodGroupSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Blood group',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            BloodGroupOption(controller: controller, bloodGroup: 'A+'),
            BloodGroupOption(controller: controller, bloodGroup: 'A-'),
            BloodGroupOption(controller: controller, bloodGroup: 'B+'),
            BloodGroupOption(controller: controller, bloodGroup: 'B-'),
            BloodGroupOption(controller: controller, bloodGroup: 'AB+'),
            BloodGroupOption(controller: controller, bloodGroup: 'AB-'),
            BloodGroupOption(controller: controller, bloodGroup: 'O+'),
            BloodGroupOption(controller: controller, bloodGroup: 'O-'),
            AddBloodGroupOption(),
          ],
        ),
      ],
    );
  }
}
