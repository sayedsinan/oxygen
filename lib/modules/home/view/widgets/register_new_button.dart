import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';

class RegisterNewPatientWithNumberButton extends StatelessWidget {
  final HomeController controller;

  const RegisterNewPatientWithNumberButton({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 521,
      height: 55,
      child: OutlinedButton(
        onPressed: () {
          controller.registerNewPatientWithNumber();
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF2C3E50), width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_add_outlined,
              color: Color(0xFF2C3E50),
              size: 18,
            ),
            const SizedBox(width: 8),
            const Text(
              'Register A New Patient With This Number',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2C3E50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
