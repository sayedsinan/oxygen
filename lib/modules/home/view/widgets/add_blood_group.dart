import 'package:flutter/material.dart';

class AddBloodGroupOption extends StatelessWidget {
  const AddBloodGroupOption({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Show dialog to add custom blood group
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFE9ECEF)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Add',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2C3E50),
              ),
            ),
            SizedBox(width: 4),
            Icon(
              Icons.add,
              size: 16,
              color: Color(0xFF2C3E50),
            ),
          ],
        ),
      ),
    );
  }
}

