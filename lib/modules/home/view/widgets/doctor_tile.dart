import 'package:flutter/material.dart';
import 'package:oxygen/app/theme/app_colors.dart';
import 'package:oxygen/data/model/doctor_model.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';


class DoctorTile extends StatelessWidget {
  final Doctor doctor;
  final HomeController controller;

  const DoctorTile({super.key, required this.doctor, required this.controller});

  @override
  Widget build(BuildContext context) {
    final isSelected = controller.selectedDoctor.value == doctor.name ||
        controller.selectedDoctor.value == doctor.specialty||
        controller.selectedDoctor.value == doctor.timing||
        controller.selectedDoctor.value == doctor.bookings;


    return InkWell(
      onTap: () {
        controller.selectDoctor(doctor.name);
        controller.searchQuery.value = '';
        controller.filteredPatients.clear();
        controller.filteredDoctors.clear();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
          color: isSelected ? Colors.blue.shade50 : Colors.white,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: doctor.color,
              
                child:  Text(doctor.initial, style: const TextStyle(color: Colors.white, fontSize: 16))
          
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctor.name, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(doctor.specialty, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.circle),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.cashBox,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(doctor.specialty, style: TextStyle(color: Colors.grey.shade700, fontSize: 11)),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.greyLight,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(doctor.timing, style: TextStyle(color: Colors.grey.shade700, fontSize: 11)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
