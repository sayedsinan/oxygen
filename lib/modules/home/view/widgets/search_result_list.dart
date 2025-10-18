import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxygen/data/model/doctor_model.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:oxygen/modules/home/view/widgets/doctor_list.dart';
import 'package:oxygen/modules/home/view/widgets/doctor_tile.dart';

class SearchResultsList extends StatelessWidget {
  final HomeController controller;
  final double width;
  final double height;

  const SearchResultsList({
    super.key,
    required this.controller,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final hasResults =
          controller.filteredPatients.isNotEmpty ||
          controller.filteredDoctors.isNotEmpty;

      if (controller.searchQuery.isEmpty) {
        return const SizedBox.shrink();
      }

      if (!hasResults) {
        return Container(
          width: width,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'No results found for "${controller.searchQuery.value}"',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
        );
      }

      return Container(
        width: width,
        constraints: BoxConstraints(maxHeight: height),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Patients Section
              if (controller.filteredPatients.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                  child: Text(
                    'Patients (${controller.filteredPatients.length})',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                ...controller.filteredPatients.map(
                  (patient) => _buildPatientTile(patient),
                ),
                const Divider(height: 1),
              ],

              // Doctors Section
              if (controller.filteredDoctors.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                  child: Text(
                    'Doctors (${controller.filteredDoctors.length})',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                ...controller.filteredDoctors.map(
                  (doctor) => _buildDoctorTile(doctor),
                ),
              ],
            ],
          ),
        ),
      );
    });
  }

  Widget _buildPatientTile(patient) {
    final isSelected = controller.selectedPatient.value == patient.name;

    return InkWell(
      onTap: () {
        controller.selectPatient(patient.name);
        controller.searchQuery.value = '';
        controller.filteredPatients.clear();
        controller.filteredDoctors.clear();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE91E63).withOpacity(0.05) : null,
          border: Border(
            bottom: BorderSide(color: Colors.grey[200]!, width: 0.5),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey[300],

              child: Text(
                patient.name[0].toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patient.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'ID${patient.id} • ${patient.phone}',
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            _buildStatusDropdown(patient),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusDropdown(patient) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        // Update patient status
        controller.updatePatientStatus(patient.id, value);
      },
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<String>(
          value: 'booked',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Text('Booked')],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'checked_in',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Color(0xFF4CAF50), size: 16),
              SizedBox(width: 8),
              Text('Check In'),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'close',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.close, color: Color(0xFFE91E63), size: 16),
              SizedBox(width: 8),
              Text('Close'),
            ],
          ),
        ),
      ],
      child: _buildStatusBadge(patient.status ?? 'booked'),
    );
  }

  Widget _buildStatusBadge(String status) {
    final statusMap = {
      'booked': {
        'label': 'Booked',
        'bgColor': Colors.white,
        'textColor': const Color(0xFFE91E63),
        'borderColor': const Color(0xFFE91E63),
      },
      'checked_in': {
        'label': 'Checked In',
        'bgColor': Colors.white,
        'textColor': const Color(0xFFFFA500),
        'borderColor': const Color(0xFFFFA500),
      },
      'close': {
        'label': 'Close',
        'bgColor': const Color(0xFFE91E63),
        'textColor': Colors.white,
      },
    };

    final config = statusMap[status] ?? statusMap['booked']!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: config['bgColor'] as Color,
        border: config.containsKey('borderColor')
            ? Border.all(color: config['borderColor'] as Color, width: 1.5)
            : null,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        config['label'] as String,
        style: TextStyle(
          color: config['textColor'] as Color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }


Widget _buildDoctorTile(Doctor doctor) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: DoctorTile(doctor: doctor, controller: controller),
  );
}


  // Add this method to your HomeController to search by category/specialty
  
  // Update your search box to support category search
}
