import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';

class SelectedChipsRow extends StatelessWidget {
  final HomeController controller;
  final double width;

  const SelectedChipsRow({
    super.key,
    required this.controller,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final hasSelections =
          controller.selectedPatient.value.isNotEmpty ||
          controller.selectedDoctor.value.isNotEmpty ||
          controller.selectedDate.value.isNotEmpty;

      if (!hasSelections) return const SizedBox.shrink();

      return SizedBox(
        width: width,
        child: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ..._buildSelectedChips()
                        .map((chip) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: chip,
                            ))
                        .toList(),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE91E63),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              child: const Text('Book'),
            ),
          ],
        ),
      );
    });
  }

  List<Widget> _buildSelectedChips() {
    final chips = <Widget>[];

    // Patient Chip
    if (controller.selectedPatient.value.isNotEmpty) {
      chips.add(
        _buildChip(
          label: 'Patient',
          value: controller.selectedPatient.value,
          onDelete: () => controller.selectedPatient.value = '',
        ),
      );
    }

    // Doctor Chip
    if (controller.selectedDoctor.value.isNotEmpty) {
      chips.add(
        _buildChip(
          label: 'Doctor',
          value: controller.selectedDoctor.value,
          onDelete: () => controller.selectedDoctor.value = '',
        ),
      );
    }

    // Date Chip
    if (controller.selectedDate.value.isNotEmpty) {
      chips.add(
        _buildChip(
          label: 'Date',
          value: controller.selectedDate.value,
          onDelete: () {
            controller.selectedDate.value = '';
            controller.selectedDateIndex.value = 4;
          },
        ),
      );
    }

    return chips;
  }

  Widget _buildChip({
    required String label,
    required String value,
    required VoidCallback onDelete,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFD1D5E8),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, size: 18, color: Color(0xFF5B6B9E)),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: onDelete,
            child: Container(
              padding: const EdgeInsets.all(4),
              child: const Icon(Icons.close, size: 20, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
