import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/view/widgets/appoinment_card.dart';


class TodayAppointmentsSection extends StatelessWidget {
  const TodayAppointmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Padding(
      padding: const EdgeInsets.only(left: 40.0, top: 20, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Today's Appointments", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16, 
            runSpacing: 16, 
            children: List.generate(
              3,
              (index) => SizedBox(
                width: isMobile ? double.infinity : 300,
                child: const ProfileCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
