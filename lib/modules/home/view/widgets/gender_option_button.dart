
import 'package:flutter/material.dart';

class GenderOptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String selectedGender;
  final VoidCallback onTap;

  const GenderOptionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.selectedGender,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedGender == value;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF2C3E50) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? const Color(0xFF2C3E50) : const Color(0xFFE9ECEF),
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: isSelected ? Colors.white : const Color(0xFF2C3E50),
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : const Color(0xFF2C3E50),
                ),
              ),
              if (isSelected) ...[
                const SizedBox(width: 6),
                const Icon(
                  Icons.check_circle,
                  size: 16,
                  color: Colors.white,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
