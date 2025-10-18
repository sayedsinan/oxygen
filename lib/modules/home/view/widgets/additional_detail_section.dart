
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:oxygen/modules/home/view/widgets/blood_group_section.dart';
import 'package:oxygen/modules/home/view/widgets/emergency_contact_section.dart';
import 'package:oxygen/modules/home/view/widgets/patient_address.dart';

class AdditionalDetailsSection extends StatelessWidget {
  final HomeController controller;

  const AdditionalDetailsSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
          onPressed: () {
            controller.showAdditionalDetails.value = !controller.showAdditionalDetails.value;
          },
          icon: Icon(
            controller.showAdditionalDetails.value ? Icons.remove : Icons.add,
            size: 18,
            color: const Color(0xFF2196F3),
          ),
          label: Text(
            controller.showAdditionalDetails.value ? 'Show less' : 'Add more details (optional)',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF2196F3),
            ),
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
        ),
        if (controller.showAdditionalDetails.value) ...[
          const SizedBox(height: 20),
          BloodGroupSection(controller: controller),
          const SizedBox(height: 20),
          PatientAddressSection(controller: controller),
          const SizedBox(height: 20),
          EmergencyContactSection(controller: controller),
        ],
      ],
    ));
  }
}
