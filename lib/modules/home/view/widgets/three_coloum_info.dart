import 'package:flutter/material.dart';

class ThreeColumnsInfo extends StatelessWidget {
  const ThreeColumnsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;

        final columnData = [
          {
            'label': 'Assigned Doctor',
            'title': 'Dr. Anjali Sharma',
            'subtitle': 'Cardiologist',
          },
          {
            'label': 'Appointment',
            'title': '04:30 PM, 28 July 2025',
            'subtitle': null,
          },
          {
            'label': 'Queue Status',
            'title': 'Token: #12',
            'subtitle': null,
          },
        ];

        Widget buildColumn(Map<String, dynamic> data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data['label'] as String,
                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
              ),
              const SizedBox(height: 4),
              Text(
                data['title'] as String,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              if (data['subtitle'] != null) ...[
                const SizedBox(height: 2),
                Text(
                  data['subtitle'] as String,
                  style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                ),
              ],
            ],
          );
        }

        if (isSmallScreen) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              columnData.length,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: index < columnData.length - 1 ? 20 : 0),
                child: buildColumn(columnData[index]),
              ),
            ),
          );
        }

        // Large screen - 3 columns side by side
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            columnData.length,
            (index) => Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: index < columnData.length - 1 ? 16 : 0),
                child: buildColumn(columnData[index]),
              ),
            ),
          ),
        );
      },
    );
  }
}