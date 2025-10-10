import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';

class SearchHistorySection extends StatelessWidget {
  final HomeController controller;

  const SearchHistorySection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.searchHistory.isEmpty) {
        return const SizedBox.shrink();
      }

      final patients = controller.searchHistory
          .where((item) => item['type'] == 'patient')
          .toList();

      final doctors = controller.searchHistory
          .where((item) => item['type'] == 'doctor')
          .toList();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (patients.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Patients',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.clearAllHistory(),
                    child: Text(
                      'Clear',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ...patients.map(
              (item) => _buildHistoryTile(
                item['query'] ?? '',
                'patient',
                const Color(0xFFE91E63),
              ),
            ),
            if (doctors.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Divider(height: 1, color: Colors.grey[300]),
              ),
          ],
          if (doctors.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 12),
              child: const Text(
                'Recent Doctors',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
            ...doctors.map(
              (item) =>
                  _buildHistoryTile(item['query'] ?? '', 'doctor', Colors.blue),
            ),
            const SizedBox(height: 12),
            Divider(height: 1, color: Colors.grey[300]),
            const SizedBox(height: 12),
          ],
        ],
      );
    });
  }
 Widget _buildHistoryTile(String name, String type, Color color) {
    return InkWell(
      onTap: () {
        if (type == 'patient') {
          controller.selectPatient(name);
        } else {
          controller.selectDoctor(name);
        }
        controller.toggleOverlay(false);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              type == 'patient' ? Icons.person : Icons.abc,
              color: color,
              size: 16,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => controller.removeFromHistory(name, type),
              child: Icon(
                Icons.close,
                color: Colors.grey[400],
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
