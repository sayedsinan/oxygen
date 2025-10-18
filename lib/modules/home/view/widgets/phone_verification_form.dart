import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:oxygen/modules/home/view/widgets/form_action_button.dart';
import 'package:oxygen/modules/home/view/widgets/form_header.dart';
import 'package:oxygen/modules/home/view/widgets/form_section_title.dart';
import 'package:oxygen/modules/home/view/widgets/phone_input_field.dart';

class PhoneVerificationFormView extends StatelessWidget {
  final HomeController controller;

  const PhoneVerificationFormView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormHeader(
          title: 'Register new patient',
          onBackPressed: () {
            controller.showRegisterForm.value = false;
            controller.clearRegistrationForm();
          },
        ),
        const SizedBox(height: 32),
        const FormSectionTitle(
          title: 'Enter Mobile Number',
          subtitle: 'Check if any patients are already registered with this number.',
        ),
        const SizedBox(height: 16),
        PhoneInputField(controller: controller),
        const SizedBox(height: 24),
        FormActionButtons(
          onClear: () => controller.phoneController.clear(),
          onSubmit: () => controller.verifyPhoneNumber(),
          submitText: 'Verify',
        ),
      ],
    );
  }
}
