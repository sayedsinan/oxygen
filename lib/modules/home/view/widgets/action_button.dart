import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/view/widgets/my_button.dart';
import '../../../../app/theme/app_colors.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onCheckInNow;

  const ActionButtons({
    super.key,
    required this.onBack,
    required this.onCheckInNow,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;

        Widget backButton = OutlinedButton(
          onPressed: onBack,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.black, width: 1.5),
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
          child: const Text(
            'Check-In & Pay Later',
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        );

        Widget payButton = MyButton(
          text: "Check-In & Pay Now",
          showArrow: false,
          textStyle: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          height: 48,
          onPressed: onCheckInNow,
        );

        if (isSmallScreen) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 48,
                child: backButton,
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: payButton,
              ),
            ],
          );
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 200,
              height: 48,
              child: backButton,
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 200,
              height: 48,
              child: payButton,
            ),
          ],
        );
      },
    );
  }
}