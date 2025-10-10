import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:oxygen/modules/home/view/widgets/date_selector.dart';
import 'package:oxygen/modules/home/view/widgets/doctor_list.dart';

class CombinedBubble extends StatelessWidget {
  final HomeController controller;
  final double width;
  final double height;

  const CombinedBubble({super.key, required this.controller, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20, offset: const Offset(0, 8))
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DateSelector(controller: controller),
            const SizedBox(height: 16),
            DoctorsList(controller: controller),
          ],
        ),
      ),
    );
  }
}
