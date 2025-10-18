
import 'package:flutter/material.dart';

class PatientCardInfo extends StatelessWidget {
  final String phone;
  final String? lastVisit;

  const PatientCardInfo({
    super.key,
    required this.phone,
    this.lastVisit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          phone,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        if (lastVisit != null) ...[
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBEE),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              lastVisit!,
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFFE91E63),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
