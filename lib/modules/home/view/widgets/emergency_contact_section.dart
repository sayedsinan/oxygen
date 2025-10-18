import 'package:flutter/material.dart';
import 'package:oxygen/app/theme/app_colors.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:oxygen/modules/home/view/widgets/custom_text_field.dart';
import 'package:oxygen/modules/home/view/widgets/relation_ship_section.dart';

class EmergencyContactSection extends StatelessWidget {
  final HomeController controller;

  const EmergencyContactSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Emergency contact',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: controller.emergencyNameController,
                hintText: 'Name',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomTextField(
                controller: controller.emergencyMobileController,
                hintText: 'Mobile number',
                keyboardType: TextInputType.phone,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          'Select relationship with the patient',
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 12),
        RelationshipSelectionWrap(controller: controller),
      ],
    );
  }
}
