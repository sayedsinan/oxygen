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
      final chips = _buildSelectedChips();

      return LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 600;

          if (isSmallScreen) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (chips.isNotEmpty)
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: chips,
                  ),
                SizedBox(height: chips.isNotEmpty ? 12 : 0),
                SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () => _handleBooking(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE91E63),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Book'),
                  ),
                ),
              ],
            );
          }

          return SizedBox(
            width: width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: chips.isEmpty
                      ? const SizedBox.shrink()
                      : Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: chips,
                        ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () => _handleBooking(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE91E63),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fixedSize: const Size(215, 55),
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
        },
      );
    });
  }

  void _handleBooking() {
    controller.isBookingSuccessful.value = true;

    Future.delayed(const Duration(milliseconds: 500), () {
      controller.selectedPatient.value = '';
      controller.selectedDoctor.value = '';
      controller.selectedDate.value = '';
      controller.selectedSlot.value = '';
      controller.selectedDateIndex.value = 4;
    });
  }

  List<Widget> _buildSelectedChips() {
    final chips = <Widget>[];

    if (controller.selectedPatient.value.isNotEmpty) {
      chips.add(
        _buildChip(
          label: 'Patient',
          value: controller.selectedPatient.value,
          onDelete: () => controller.selectedPatient.value = '',
        ),
      );
    }

    if (controller.selectedDoctor.value.isNotEmpty) {
      chips.add(
        _buildChip(
          label: 'Doctor',
          value: controller.selectedDoctor.value,
          onDelete: () => controller.selectedDoctor.value = '',
        ),
      );
    }

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
            child:  Image.asset("assets/tick.png", width: 16, height: 16 ),
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