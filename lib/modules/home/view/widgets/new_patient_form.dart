import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/view/widgets/additional_detail_section.dart';
import 'package:oxygen/modules/home/view/widgets/form_action_button.dart';
import 'package:oxygen/modules/home/view/widgets/form_header.dart';
import 'package:oxygen/modules/home/view/widgets/gender_selection.dart';
import 'package:oxygen/modules/home/view/widgets/patient_basic_info.dart';
import 'package:oxygen/modules/home/view/widgets/phone_display_field.dart';

import '../../controller/home_controller.dart';

class NewPatientFormView extends StatelessWidget {
  final HomeController controller;

  const NewPatientFormView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormHeader(
            title: 'Register patient',
            onBackPressed: () {
              controller.showNewPatientForm.value = false;
            },
          ),
          const SizedBox(height: 24),
          PhoneDisplayField(controller: controller),
          const SizedBox(height: 20),
          PatientBasicInfoSection(controller: controller),
          const SizedBox(height: 20),
          GenderSelectionSection(controller: controller),
          const SizedBox(height: 16),
          AdditionalDetailsSection(controller: controller),
          const SizedBox(height: 24),
          FormActionButtons(
            onClear: () => controller.clearNewPatientForm(),
            onSubmit: () => controller.registerPatient(),
            submitText: 'Register',
          ),
        ],
      ),
    );
  }
}
