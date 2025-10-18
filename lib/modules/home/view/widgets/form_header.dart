import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBackPressed;

  const FormHeader({
    super.key,
    required this.title,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56, // Optional: height of the header
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Back button
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBackPressed,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
          // Centered title
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2C3E50),
            ),
          ),
        ],
      ),
    );
  }
}
