import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:oxygen/modules/home/view/widgets/new_patient_form.dart';
import 'package:oxygen/modules/home/view/widgets/patient_list.dart';
import 'package:oxygen/modules/home/view/widgets/phone_verification_form.dart';
import 'package:oxygen/modules/home/view/widgets/register_succes.dart';

class RegisterPatientFormView extends StatelessWidget {
  final HomeController controller;

  const RegisterPatientFormView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isRegistrationSuccess.value) {
        return RegistrationSuccessView(controller: controller);
      }

      if (controller.showNewPatientForm.value) {
        return NewPatientFormView(controller: controller);
      }

      if (controller.isPhoneVerified.value) {
        return PatientListView(controller: controller);
      }

      return PhoneVerificationFormView(controller: controller);
    });
  }
}
