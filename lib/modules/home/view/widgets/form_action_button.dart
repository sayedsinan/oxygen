
import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/view/widgets/my_button.dart';

class FormActionButtons extends StatelessWidget {
  final VoidCallback onClear;
  final VoidCallback onSubmit;
  final String submitText;

  const FormActionButtons({
    super.key,
    required this.onClear,
    required this.onSubmit,
    required this.submitText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onClear,
          child: Text(
            'Clear All',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2C3E50),
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        MyButton(
          width: 138,
          height: 55,
          onPressed: onSubmit,
          text: submitText,
          showArrow: false,
        )
      ],
    );
  }
}
