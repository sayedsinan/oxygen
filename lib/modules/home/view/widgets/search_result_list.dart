import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';

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
      final hasResults = controller.filteredPatients.isNotEmpty || 
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
              )
            ],
          ),
          child: Center(
            child: Text(
              'No results found for "${controller.searchQuery.value}"',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
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
            )
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
                ...controller.filteredPatients.map((patient) => 
                  _buildPatientTile(patient)
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
                ...controller.filteredDoctors.map((doctor) => 
                  _buildDoctorTile(doctor)
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
        controller.searchQuery.value = '';  // Clear search first
        controller.filteredPatients.clear();
        controller.filteredDoctors.clear();
        // Don't close overlay - let user see the chip
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE91E63).withOpacity(0.1) : null,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFFE91E63).withOpacity(0.2),
              child: Text(
                patient.name[0].toUpperCase(),
                style: const TextStyle(
                  color: Color(0xFFE91E63),
                  fontWeight: FontWeight.bold,
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
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${patient.gender} • ${patient.phone}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Color(0xFFE91E63),
                size: 20,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorTile(doctor) {
    final isSelected = controller.selectedDoctor.value == doctor.name;
    
    return InkWell(
      onTap: () {
        controller.selectDoctor(doctor.name);
        controller.searchQuery.value = '';  // Clear search first
        controller.filteredPatients.clear();
        controller.filteredDoctors.clear();
        // Don't close overlay - let user see the chip
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? doctor.color.withOpacity(0.1) : null,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: doctor.color,
              child: Text(
                doctor.initial,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    doctor.specialty,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: doctor.color,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}