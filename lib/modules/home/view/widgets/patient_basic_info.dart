import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:oxygen/modules/home/view/widgets/custom_text_field.dart';

class PatientBasicInfoSection extends StatelessWidget {
  final HomeController controller;

  const PatientBasicInfoSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: controller.patientNameController,
            hintText: 'Name of the patient',
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 80,
          child: CustomTextField(
            controller: controller.patientAgeController,
            hintText: 'Age',
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
