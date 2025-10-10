import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';

class DoctorsList extends StatelessWidget {
  final HomeController controller;
  const DoctorsList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('MOST POPULAR DOCTORS', style: TextStyle(color: Colors.blue.shade600, fontSize: 11)),
        const SizedBox(height: 12),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.doctors.length,
          itemBuilder: (context, index) {
            final doc = controller.doctors[index];
            return InkWell(
              onTap: () => controller.selectDoctor(doc['name']),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: doc['color'],
                      child: Text(doc['initial'], style: const TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: Text(doc['name'], style: const TextStyle(fontSize: 14))),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
