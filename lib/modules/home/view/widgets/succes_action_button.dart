import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:oxygen/modules/home/view/widgets/my_button.dart';

class SuccessActionButtons extends StatelessWidget {
  final HomeController controller;

  const SuccessActionButtons({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // Set the same width and height for both buttons
    const double buttonWidth = 150;
    const double buttonHeight = 48;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: buttonWidth,
          height: buttonHeight,
          child: OutlinedButton(
            onPressed: () {
              controller.exitToMainView();
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF2C3E50), width: 1.5),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Exit to Dashboard',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2C3E50),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: buttonWidth,
          height: buttonHeight,
          child: MyButton(
            width: buttonWidth,
            height: buttonHeight,
            onPressed: () {
              controller.bookNowAfterRegistration();
            },
            text: 'Book Now',
            showArrow: false,
          ),
        ),
      ],
    );
  }
}
